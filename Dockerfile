# Build stage
FROM dart:stable AS build

WORKDIR /app

# Install Jaspr CLI and Tailwind CSS
RUN dart pub global activate jaspr_cli && \
    apt-get update && apt-get install -y curl && \
    ARCH=$(dpkg --print-architecture) && \
    if [ "$ARCH" = "arm64" ]; then TW_ARCH="arm64"; else TW_ARCH="x64"; fi && \
    curl -sLO https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-linux-$TW_ARCH && \
    chmod +x tailwindcss-linux-$TW_ARCH && \
    mv tailwindcss-linux-$TW_ARCH /usr/local/bin/tailwindcss

# Copy pubspec files first (for caching)
COPY pubspec.* ./

# Get dependencies
RUN dart pub get

# Copy source code
COPY . .

# Sync duxt_ui package for Tailwind CSS scanning
RUN mkdir -p .duxt/packages/duxt_ui && \
    cp -r /root/.pub-cache/hosted/pub.dev/duxt_ui-*/lib/* .duxt/packages/duxt_ui/

# Compile Tailwind CSS
RUN tailwindcss --input web/styles.tw.css --output web/styles.css --minify

# Build frontend
RUN ~/.pub-cache/bin/jaspr build

# Build server (with native assets support)
RUN dart build cli -t server/main.dart -o /app/.output

# Runtime stage - nginx for static files, dart server for API
FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    ca-certificates \
    libsqlite3-0 \
    nginx \
    supervisor \
    && rm -rf /var/lib/apt/lists/* \
    && ln -s /usr/lib/*-linux-gnu/libsqlite3.so.0 /usr/lib/libsqlite3.so 2>/dev/null || true

WORKDIR /app

# Copy server bundle (binary + native libs)
COPY --from=build /app/.output/bundle /app

# Copy frontend static files to nginx
COPY --from=build /app/build/jaspr /var/www/html

# Nginx config - proxy /api to dart server
RUN echo 'server { \
    listen 3000; \
    root /var/www/html; \
    index index.html; \
    location /api { \
        proxy_pass http://127.0.0.1:3001; \
        proxy_set_header Host $host; \
        proxy_set_header X-Real-IP $remote_addr; \
    } \
    location / { \
        try_files $uri $uri/ /index.html; \
    } \
}' > /etc/nginx/sites-available/default

# Supervisor config
RUN echo '[supervisord]\nnodaemon=true\n\n[program:nginx]\ncommand=nginx -g "daemon off;"\n\n[program:api]\ncommand=/app/bin/main\ndirectory=/app\nenvironment=PORT="3001",DATA_DIR="/app/data"\n' > /etc/supervisor/conf.d/app.conf

# Create data directory
RUN mkdir -p /app/data

ENV PORT=3001
ENV DATA_DIR=/app/data

EXPOSE 3000

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
