#!/usr/bin/env bash
set -euo pipefail

PROJECT_ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
OUTPUT_DIR="${PROJECT_ROOT}/dist"

rm -rf -- "${OUTPUT_DIR}"
mkdir -p -- "${OUTPUT_DIR}"
cp -- "${PROJECT_ROOT}/index.html" "${PROJECT_ROOT}/manus-routes.json" "${OUTPUT_DIR}/"

printf 'Static site prepared in %s\n' "${OUTPUT_DIR}"
