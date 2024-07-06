#!/usr/bin/env bash

set -euo pipefail

CWD="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd | sed 's|/tests$||g')"
cd "${CWD}" || exit 1
nvim -u "${CWD}/tests/manual_tests.lua"
