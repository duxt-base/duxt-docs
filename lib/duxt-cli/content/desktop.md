---
title: Desktop Apps
description: Build native desktop applications with Duxt and Tauri.
layout: cli-layout
order: 3.5
---

# Desktop Apps

Build native desktop applications using Duxt with Tauri v2. Your Dart/Jaspr web app runs inside a native window with access to system APIs, file system, and more.

## Prerequisites

- **Rust** - Install from [rustup.rs](https://rustup.rs/)
- **cargo-tauri** - Auto-installed on first build if missing

## Quick Start

```
# Create a desktop project
duxt create my-app --desktop

# Start development with native window
cd my-app
duxt dev --desktop

# Build for distribution
duxt build desktop
```

## Creating a Desktop Project

```
duxt create my-app --desktop
```

This creates a Duxt project configured for desktop:

- Uses the **Client (SPA)** template (required for desktop)
- Sets `jaspr.mode: client` in pubspec.yaml
- Scaffolds the Tauri project structure on first build/dev

### Project Structure

```
my-app/
  lib/                     Dart/Jaspr components
    home/
      pages/
        index.dart
    shared/
      layouts/
        default.dart
  web/
    index.html
    styles.tw.css
  src-tauri/                Tauri backend (auto-generated)
    Cargo.toml              Rust package config
    tauri.conf.json         Window & platform config
    src/
      main.rs
      lib.rs
    build.rs
    capabilities/
      default.json
    icons/                  App icons
  pubspec.yaml
  duxt.config.dart
```

The `src-tauri/` directory is automatically created on the first `duxt dev --desktop` or `duxt build desktop` run. You don't need to set up Rust manually.

## Development

### Desktop Dev Server

```
duxt dev --desktop
```

This starts:

1. The Duxt dev server (with hot reload)
2. Compiles and launches a native Tauri window pointing at the dev server
3. Both Dart and CSS changes hot reload in the native window

Options:

| Option | Description | Default |
|--------|-------------|---------|
| `--port` | Dev server port | `4000` |
| `--verbose` | Show Tauri compilation output | `false` |

```
# Custom port
duxt dev --desktop --port=3000

# See Rust compilation progress
duxt dev --desktop --verbose
```

Output prefixed with `[desktop]` shows Tauri-specific messages.

### Web-Only Development

You can still use regular `duxt dev` (without `--desktop`) to develop in the browser. Switch to `--desktop` when you need to test native features.

## Building

### Production Build

```
duxt build desktop
```

The build pipeline:

1. Checks for Rust/Cargo prerequisites
2. Auto-installs `cargo-tauri` if needed
3. Syncs packages for Tailwind CSS scanning
4. Compiles Tailwind CSS
5. Generates routes
6. Runs `jaspr build` for frontend
7. Runs `cargo tauri build` for the native binary

Output is in `src-tauri/target/release/bundle/`:

```
src-tauri/target/release/bundle/
  macos/                   macOS .app bundle
  dmg/                     macOS installer
  deb/                     Linux .deb package
  msi/                     Windows installer
```

### Debug Build

```
duxt build desktop --debug
```

Builds without optimizations for faster compile times during testing.

### Platform Support

| Platform | Bundle Format |
|----------|--------------|
| macOS | `.app`, `.dmg` |
| Windows | `.exe`, `.msi` |
| Linux | `.deb`, `.AppImage` |

Builds target the current platform by default. Cross-compilation requires platform-specific toolchains.

## Configuration

### Window Settings

Edit `src-tauri/tauri.conf.json` to customize the window:

```
{
  "app": {
    "windows": [
      {
        "title": "My App",
        "width": 1200,
        "height": 800,
        "resizable": true,
        "fullscreen": false
      }
    ]
  }
}
```

### App Metadata

```
{
  "productName": "My App",
  "version": "1.0.0",
  "identifier": "dev.duxt.my-app",
  "bundle": {
    "icon": [
      "icons/32x32.png",
      "icons/128x128.png",
      "icons/128x128@2x.png",
      "icons/icon.icns",
      "icons/icon.ico"
    ]
  }
}
```

### App Icons

Replace the default icons in `src-tauri/icons/` with your own. Supported formats:

- `32x32.png` - Taskbar icon
- `128x128.png` - App icon
- `128x128@2x.png` - Retina app icon
- `icon.icns` - macOS icon
- `icon.ico` - Windows icon

You can use `cargo tauri icon path/to/source.png` to generate all sizes from a single source image.

## How It Works

Desktop apps use the **Client (SPA)** rendering mode. The Dart/Jaspr app compiles to JavaScript and runs inside a Tauri webview:

```
Tauri Native Window
  -> WebView (system browser engine)
    -> Your Duxt SPA (compiled JS)
    -> Client-side routing
    -> Fetch API for backend calls
```

Key points:

- **No server required** - The app runs entirely client-side
- **System webview** - Uses the OS browser engine (WebKit on macOS, WebView2 on Windows, WebKitGTK on Linux)
- **Small binary** - No bundled browser engine (unlike Electron)
- **Native APIs** - Access file system, notifications, and more through Tauri plugins

## Limitations

- Desktop requires **Client (SPA)** mode - server-side rendering is not available
- The `server/` directory is not used in desktop builds
- API calls need an external backend or local server

## Workflow

A typical desktop development workflow:

```
# 1. Create desktop project
duxt create my-app --desktop
cd my-app

# 2. Generate modules
duxt g module settings
duxt scaffold posts title:String content:String

# 3. Develop with native window
duxt dev --desktop

# 4. Test in browser too
duxt dev

# 5. Build for distribution
duxt build desktop

# 6. Find your bundle
ls src-tauri/target/release/bundle/
```

## See Also

- [duxt create](/duxt-cli/create) - Creating projects
- [duxt dev](/duxt-cli/dev) - Development server
- [duxt build](/duxt-cli/build) - Build commands
