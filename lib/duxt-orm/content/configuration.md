---
title: Database Configuration
description: Configure database connections for PostgreSQL, MySQL, and SQLite.
layout: orm-layout
order: 2
---

# Database Configuration

## Overview

Database configuration lives in your `duxt.config.dart` file. All connection settings use `String.fromEnvironment` so you can set defaults for development and override them in production via environment variables.

## duxt.config.dart

When you create a server project (`duxt create myapp -t server`), the config file includes a `database` record:

```
// duxt.config.dart
class DuxtConfig {
  static const app = (
    name: 'myapp',
    description: 'A Duxt application',
  );

  static const String mode = 'server';
  static const String apiBase = '/api';
  static const int port = 3000;

  /// Database configuration
  static const database = (
    driver: String.fromEnvironment('DB_DRIVER', defaultValue: 'sqlite'),
    host: String.fromEnvironment('DB_HOST', defaultValue: 'localhost'),
    port: int.fromEnvironment('DB_PORT', defaultValue: 5432),
    database: String.fromEnvironment('DB_NAME', defaultValue: 'myapp'),
    username: String.fromEnvironment('DB_USER', defaultValue: ''),
    password: String.fromEnvironment('DB_PASS', defaultValue: ''),
    path: String.fromEnvironment('DB_PATH', defaultValue: 'data/myapp.db'),
    ssl: bool.fromEnvironment('DB_SSL', defaultValue: false),
  );
}
```

Then pass it to the ORM in your `server/db.dart`:

```
import '../duxt.config.dart';
import 'package:duxt_orm/duxt_orm.dart';
import '../lib/models/post.dart';

class Db {
  static Future<void> init() async {
    Post.register();
    await DuxtOrm.init(DuxtConfig.database);
    await DuxtOrm.migrate();
  }
}
```

## Configuration Fields

| Field | Type | Description |
|-------|------|-------------|
| `driver` | `String` | Database driver: `'sqlite'`, `'postgres'`, or `'mysql'` |
| `host` | `String` | Database server hostname |
| `port` | `int` | Database server port |
| `database` | `String` | Database name |
| `username` | `String` | Database username |
| `password` | `String` | Database password |
| `path` | `String` | File path for SQLite database |
| `ssl` | `bool` | Enable SSL/TLS connection |

## SQLite (Default)

SQLite requires no credentials. Just set the file path:

```
static const database = (
  driver: 'sqlite',
  host: '',
  port: 0,
  database: '',
  username: '',
  password: '',
  path: 'data/myapp.db',
  ssl: false,
);
```

Or use the default config which already defaults to SQLite. The database file is created automatically at the specified path.

## MySQL

```
static const database = (
  driver: String.fromEnvironment('DB_DRIVER', defaultValue: 'mysql'),
  host: String.fromEnvironment('DB_HOST', defaultValue: 'localhost'),
  port: int.fromEnvironment('DB_PORT', defaultValue: 3306),
  database: String.fromEnvironment('DB_NAME', defaultValue: 'myapp'),
  username: String.fromEnvironment('DB_USER', defaultValue: 'root'),
  password: String.fromEnvironment('DB_PASS', defaultValue: ''),
  path: '',
  ssl: bool.fromEnvironment('DB_SSL', defaultValue: false),
);
```

Run with environment variables:

```
DB_DRIVER=mysql DB_HOST=localhost DB_PORT=3306 DB_NAME=myapp DB_USER=root DB_PASS=secret duxt dev
```

Or pass as compile-time defines:

```
dart run --define=DB_DRIVER=mysql --define=DB_HOST=localhost --define=DB_PORT=3306 --define=DB_NAME=myapp --define=DB_USER=root --define=DB_PASS=secret server/main.dart
```

### MySQL Dependencies

Add the MySQL driver to your `pubspec.yaml`:

```
dependencies:
  duxt_orm: ^0.4.0
  mysql_client: ^0.0.27
```

## PostgreSQL

```
static const database = (
  driver: String.fromEnvironment('DB_DRIVER', defaultValue: 'postgres'),
  host: String.fromEnvironment('DB_HOST', defaultValue: 'localhost'),
  port: int.fromEnvironment('DB_PORT', defaultValue: 5432),
  database: String.fromEnvironment('DB_NAME', defaultValue: 'myapp'),
  username: String.fromEnvironment('DB_USER', defaultValue: 'postgres'),
  password: String.fromEnvironment('DB_PASS', defaultValue: ''),
  path: '',
  ssl: bool.fromEnvironment('DB_SSL', defaultValue: false),
);
```

Run with environment variables:

```
DB_DRIVER=postgres DB_HOST=localhost DB_PORT=5432 DB_NAME=myapp DB_USER=postgres DB_PASS=secret duxt dev
```

### PostgreSQL Dependencies

Add the PostgreSQL driver to your `pubspec.yaml`:

```
dependencies:
  duxt_orm: ^0.4.0
  postgres: ^3.1.0
```

### SSL Connections

For remote PostgreSQL (e.g. Supabase, Neon, Railway):

```
DB_DRIVER=postgres DB_HOST=db.example.com DB_PORT=5432 DB_NAME=myapp DB_USER=postgres DB_PASS=secret DB_SSL=true duxt dev
```

## Environment Variables Reference

| Variable | Default | Description |
|----------|---------|-------------|
| `DB_DRIVER` | `sqlite` | Database driver (`sqlite`, `postgres`, `mysql`) |
| `DB_HOST` | `localhost` | Database server hostname |
| `DB_PORT` | `5432` | Database server port |
| `DB_NAME` | project name | Database name |
| `DB_USER` | (empty) | Database username |
| `DB_PASS` | (empty) | Database password |
| `DB_PATH` | `data/<project>.db` | SQLite file path |
| `DB_SSL` | `false` | Enable SSL/TLS |

## .env.sample

Server projects include a `.env.sample` file with commented examples:

```
# Server configuration
PORT=4100

# SQLite (default - no config needed)
# DB_PATH=data/myapp.db

# MySQL:
# DB_DRIVER=mysql
# DB_HOST=localhost
# DB_PORT=3306
# DB_NAME=myapp
# DB_USER=root
# DB_PASS=secret

# PostgreSQL:
# DB_DRIVER=postgres
# DB_HOST=localhost
# DB_PORT=5432
# DB_NAME=myapp
# DB_USER=postgres
# DB_PASS=secret
# DB_SSL=false
```

## Docker Compose

For local development with MySQL or PostgreSQL, use Docker Compose:

```
# docker-compose.yml
services:
  db:
    image: mysql:8
    environment:
      MYSQL_ROOT_PASSWORD: secret
      MYSQL_DATABASE: myapp
    ports:
      - "3306:3306"

  app:
    build: .
    environment:
      DB_DRIVER: mysql
      DB_HOST: db
      DB_PORT: "3306"
      DB_NAME: myapp
      DB_USER: root
      DB_PASS: secret
    ports:
      - "3000:3000"
    depends_on:
      - db
```

PostgreSQL variant:

```
services:
  db:
    image: postgres:16
    environment:
      POSTGRES_PASSWORD: secret
      POSTGRES_DB: myapp
    ports:
      - "5432:5432"

  app:
    build: .
    environment:
      DB_DRIVER: postgres
      DB_HOST: db
      DB_PORT: "5432"
      DB_NAME: myapp
      DB_USER: postgres
      DB_PASS: secret
    ports:
      - "3000:3000"
    depends_on:
      - db
```

## Switching Databases

The ORM API is identical across all drivers. To switch from SQLite to MySQL:

1. Update `duxt.config.dart` defaults (or set environment variables)
2. Add the driver dependency to `pubspec.yaml`
3. Run `dart pub get`
4. Start your server — `DuxtOrm.migrate()` creates tables automatically

No code changes needed in your models or queries.
