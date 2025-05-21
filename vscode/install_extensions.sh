#!/usr/bin/env bash
set -e
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

xargs -l1 code --install-extension < "$SCRIPT_DIR/extensions.txt"
