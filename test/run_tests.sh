#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

npx numbl run --path "$REPO_DIR/numbl" --path "$REPO_DIR" "$SCRIPT_DIR/test_wdot.m"
