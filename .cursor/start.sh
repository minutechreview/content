#!/usr/bin/env bash
# Starts the MDN Web Docs local preview server (Fred + Rari) on port 5042.
set -euo pipefail

cd "$(git rev-parse --show-toplevel)"

export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
# shellcheck disable=SC1091
. "$NVM_DIR/nvm.sh"

NODE_VERSION="$(cat .nvmrc)"
NODE_BIN_DIR="$(dirname "$(nvm which "$NODE_VERSION")")"
export PATH="$NODE_BIN_DIR:$PATH"

exec npm start
