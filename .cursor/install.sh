#!/usr/bin/env bash
# Idempotent dependency setup for MDN Web Docs content.
# Installs the Node.js version pinned in .nvmrc (via nvm) and project deps.
set -euo pipefail

cd "$(git rev-parse --show-toplevel)"

export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
# shellcheck disable=SC1091
. "$NVM_DIR/nvm.sh"

NODE_VERSION="$(cat .nvmrc)"
nvm install "$NODE_VERSION"
nvm alias default "$NODE_VERSION"

# Ensure the pinned Node is first on PATH (the base image ships an older Node).
NODE_BIN_DIR="$(dirname "$(nvm which "$NODE_VERSION")")"
export PATH="$NODE_BIN_DIR:$PATH"

node --version
npm --version

npm install
