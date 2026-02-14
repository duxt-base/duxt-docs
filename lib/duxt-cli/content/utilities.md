---
title: Utility Commands
description: Info, doctor, clean, update, and version commands for project management.
layout: cli-layout
order: 7
---

# Utility Commands

Commands for managing your Duxt project and CLI installation.

---

## duxt info

Display information about the current Duxt project.

### Usage

```
duxt info
```

### Output

```
╭─────────────────────────────────────╮
│  Duxt Project Info                  │
╰─────────────────────────────────────╯

  Name:       my-app
  Version:    1.0.0
  Mode:       server
  Duxt:       0.6.0

  Structure:
    Modules:    5
    Pages:      12
    Components: 8
    Models:     4
    API Routes: 4

  Dependencies:
    jaspr:        ^0.22.2
    jaspr_router: ^0.8.0
    duxt:         ^0.6.0
    duxt_ui:      ^0.3.0
    duxt_orm:     ^0.2.0

  Paths:
    Frontend:   lib/
    Server:     server/
    Output:     .output/
```

### What It Shows

- **Project metadata** from `pubspec.yaml`
- **Project mode** from `duxt.yaml`
- **File counts** for modules, pages, components, models, APIs
- **Dependencies** relevant to Duxt
- **Path configuration**

---

## duxt doctor

Check your environment and project setup for issues.

### Usage

```
duxt doctor
```

### Output

```
╭─────────────────────────────────────╮
│  Duxt Doctor                        │
╰─────────────────────────────────────╯

Checking environment...

  ✓ Dart SDK 3.5.0
  ✓ Duxt CLI 0.6.0
  ✓ Jaspr 0.22.2

Checking project...

  ✓ pubspec.yaml found
  ✓ duxt.yaml found
  ✓ lib/ directory exists
  ✓ web/index.html exists

Checking dependencies...

  ✓ jaspr ^0.22.2 (0.22.2 installed)
  ✓ jaspr_router ^0.8.0 (0.8.1 installed)
  ✓ duxt ^0.6.0 (0.6.0 installed)
  ✓ duxt_ui ^0.3.0 (0.3.0 installed)
  ⚠ duxt_orm ^0.2.0 (0.1.9 installed) - update available

Checking server mode...

  ✓ server/main.dart exists
  ✓ server/db.dart exists
  ✓ Database file writable

Summary:
  ✓ 12 checks passed
  ⚠ 1 warning
  ✗ 0 errors
```

### Checks Performed

**Environment:**
- Dart SDK version
- Duxt CLI version
- Jaspr installation

**Project Structure:**
- Required config files
- Directory structure
- Entry points

**Dependencies:**
- Version compatibility
- Available updates
- Missing packages

**Server Mode (if applicable):**
- Server files exist
- Database configuration
- Permissions

### Fixing Issues

Doctor provides actionable suggestions:

```
✗ duxt_orm not found in dependencies

  Add to pubspec.yaml:
    dependencies:
      duxt_orm: ^0.2.0

  Then run:
    dart pub get
```

---

## duxt clean

Remove build artifacts, caches, and generated files.

### Usage

```
duxt clean
```

### What It Removes

- `.output/` - Build output directory
- `.dart_tool/` - Dart tool cache
- `.generated/` - Generated route files
- `build/` - Jaspr build directory

### Output

```
╭─────────────────────────────────────╮
│  Duxt Clean                         │
╰─────────────────────────────────────╯

→ Removing .output/
  ✓ Removed 45 files (12.3 MB)

→ Removing .dart_tool/
  ✓ Removed 128 files (8.1 MB)

→ Removing .generated/
  ✓ Removed 2 files (4 KB)

→ Running jaspr clean...
  ✓ Jaspr cache cleared

✓ Clean complete!
  Freed 20.4 MB
```

### When to Use

- Build issues or stale artifacts
- Before switching branches
- To reduce disk usage
- After major dependency updates

### Options

```
# Clean only build output
duxt clean --output

# Clean only generated files
duxt clean --generated

# Clean everything including pub cache
duxt clean --all
```

---

## duxt update

Update the Duxt CLI to the latest version.

### Usage

```
duxt update
```

### Output

```
Duxt Checking for updates...

  Current version: 0.5.7
  Latest version:  0.6.0

→ Updating...

✓ Updated to 0.6.0!
```

### What It Does

Checks pub.dev for the latest version and runs `dart pub global activate duxt` to install it. The version check uses Dart's `HttpClient` with a 10-second timeout.

### Checking for Updates

The CLI automatically checks for updates in the background when you run any command (with a 2-second timeout so it never slows you down). If an update is available, you'll see:

```
┌─────────────────────────────────────────────────┐
│  Update available: 0.5.7 → 0.6.0               │
│  Run duxt update to update                      │
└─────────────────────────────────────────────────┘
```

---

## duxt version

Display the current Duxt CLI version.

### Usage

```
duxt version
duxt --version
duxt -v
```

### Output

```
Duxt 0.6.0
```

### Version Format

Duxt follows semantic versioning:

```
MAJOR.MINOR.PATCH
  │     │     │
  │     │     └── Bug fixes, small improvements
  │     └──────── New features, backward compatible
  └────────────── Breaking changes
```

### In Scripts

Use version in scripts:

```
# Check version
VERSION=$(duxt version | sed 's/Duxt //')
echo "Using Duxt $VERSION"

# Require minimum version
REQUIRED="0.6.0"
if [[ "$(printf '%s\n' "$REQUIRED" "$VERSION" | sort -V | head -n1)" != "$REQUIRED" ]]; then
  echo "Duxt $REQUIRED or higher required"
  exit 1
fi
```

---

## Summary

| Command | Purpose |
|---------|---------|
| `duxt info` | Show project information |
| `duxt doctor` | Diagnose environment and project |
| `duxt clean` | Remove build artifacts |
| `duxt update` | Update CLI to latest |
| `duxt version` | Show current version |
