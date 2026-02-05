#!/bin/bash

# Deploy script for duxt.dev docs
# Automatically syncs version from duxt package

set -e

# Get version from duxt pubspec.yaml
DUXT_VERSION=$(grep "^version:" ../duxt/pubspec.yaml | sed 's/version: //')

echo ""
echo "Deploying duxt.dev docs"
echo "Version: v$DUXT_VERSION"
echo ""

# Update version in landing_hero.dart
sed -i '' "s/v[0-9]\+\.[0-9]\+\.[0-9]\+/v$DUXT_VERSION/" lib/shared/components/landing_hero.dart
echo "✓ Updated version to v$DUXT_VERSION"

# Build
echo "→ Building..."
duxt build

# Deploy
echo "→ Deploying..."
bp deploy --force

echo ""
echo "✓ Deployed v$DUXT_VERSION to https://duxt.dev"
echo ""
