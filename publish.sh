#!/bin/bash

# exit on error
set -e

# Bump type: patch, minor or major
BUMP_TYPE=${1:-patch}

echo "🔎 Checking for changes in the repository..."

# If there are no changes to commit, exit
if git diff-index --quiet HEAD --; then
  echo "⚠️ No uncommitted changes. Exiting..."
  exit 0
fi

# Commit local changes
echo "📦 Committing local changes..."
git add .
git commit -m "chore: prepare release"

# Automatically bump version
echo "⬆️ Bumping version ($BUMP_TYPE)..."
npm version $BUMP_TYPE -m "release: %s"

# Build library
echo "⚙️ Building..."
npm run build

# Publish to npm
echo "🚀 Publishing to npm..."
npm publish --access public

# Push changes and tags to Git
echo "⬆️ Pushing changes and tags..."
git push origin main --follow-tags

echo "✅ Release completed!"
