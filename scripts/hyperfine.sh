#!/usr/bin/env bash

set -euo pipefail

if ! which hyperfine >/dev/null 2>&1; then
        echo 'ERROR: hyperfine was not found.'
        return 1
fi

MAX_RUNS=1000
CWD="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd | sed 's|/tests$||g')"
CWD="${CWD}/.."
cd "${CWD}" || exit 1

ROOT_PLUGINS='/tmp/neopywal_hyperfine/plugins'
LAZYPATH="${ROOT_PLUGINS}/lazy.nvim"

[ ! -d "${LAZYPATH}" ] && echo ":: Setting up lazy.nvim ..." && git clone --filter=blob:none https://github.com/folke/lazy.nvim.git "${LAZYPATH}"
[ ! -d "${ROOT_PLUGINS}/catppuccin" ] && echo ":: Setting up catppuccin.nvim ..." && git clone 'https://github.com/catppuccin/nvim' "${ROOT_PLUGINS}/catppuccin"
[ ! -d "${ROOT_PLUGINS}/tokyonight.nvim" ] && echo ":: Setting up tokyonight.nvim ..." && git clone 'https://github.com/folke/tokyonight.nvim' "${ROOT_PLUGINS}/tokyonight.nvim"

for theme in neopywal catppuccin tokyonight; do
        COLORSCHEME="${theme}" hyperfine --style full \
                --warmup 5 \
                --runs "${MAX_RUNS:-100}" \
                --time-unit millisecond \
                --command-name "$theme ${MAX_RUNS:-100} runs" \
                --prepare "nvim --headless +qa -u ${CWD}/tests/hyperfine.lua" \
                "nvim --headless +qa -u ${CWD}/tests/hyperfine.lua"
done
