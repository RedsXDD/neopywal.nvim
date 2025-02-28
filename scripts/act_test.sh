#!/usr/bin/env bash

set -euo pipefail

CWD="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd | sed 's|/tests$||g')"
cd "${CWD}" || exit 1

if ! which act >/dev/null 2>&1; then
        echo 'ERROR: act must be installed!'
        exit 1
fi

if ! which gh >/dev/null 2>&1; then
        echo 'ERROR: the github cli tool (gh) must be installed!'
        exit 1
fi

clear
act -j act_tests -s GITHUB_TOKEN="$(gh auth token)"

# vim:fileencoding=utf-8:foldmethod=marker
