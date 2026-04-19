#!/usr/bin/env bash

set -euo pipefail

CWD="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd | sed 's|/tests$||g')"
CWD="${CWD}/.."
cd "${CWD}" || exit 1
nvim -u "${CWD}/tests/lazy_test.lua" "$@"
