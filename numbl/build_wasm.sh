#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

if ! command -v emcc &> /dev/null; then
  echo "Error: emcc (Emscripten) not found on PATH." >&2
  exit 1
fi

echo "Compiling wdot.c -> wdot.wasm"
emcc "$SCRIPT_DIR/wdot.c" -O2 \
  -s STANDALONE_WASM \
  --no-entry \
  -o "$SCRIPT_DIR/wdot.wasm"

echo "Built wdot.wasm ($(wc -c < "$SCRIPT_DIR/wdot.wasm") bytes)"
