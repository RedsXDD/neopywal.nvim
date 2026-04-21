#!/usr/bin/env bash

set -euo pipefail

if ! which hyperfine >/dev/null 2>&1; then
        echo 'ERROR: hyperfine was not found.'
        return 1
fi

CWD="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd | sed 's|/tests$||g')"
CWD="${CWD}/.."
cd "${CWD}" || exit 1

case "${1:--}" in
        '-l' | '--load')
                shift
                nvim -u "${CWD}/tests/hyprfine.lua" "$@"
                exit 0
                ;;
        '-r' | '--run')
                MAX_RUNS=100
                for opt in neopywal catppuccin tokyonight; do
                        COLORSCHEME="${opt}" hyperfine --style full \
                                --command-name "$opt ${MAX_RUNS:-100} runs" \
                                --time-unit millisecond \
                                --prepare "rm -rvf /tmp/neopywal_profiling/cache/nvim/" \
                                --warmup 5 \
                                --runs "${MAX_RUNS:-100}" \
                                "nvim --headless +qa -u ${CWD}/tests/hyprfine.lua"
                done
                exit 0
                ;;
        *) echo 'Usage: either pass -l/--load or -r/--run' ;;
esac
