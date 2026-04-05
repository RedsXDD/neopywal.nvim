#!/usr/bin/env sh

# Run this script on the cmd with `$ sh ./scripts/doc_build.sh`
# while being on the root neopywal.nvim git path.
# e.g, if the neopywal.nvim repo was cloned into ~/neopywal.nvim,
#      then cd EXACTLY into ~/neopywal.nvim and while inside that directory
#      run `$ sh ./scripts/doc_build.sh`.

if ! which pandoc >/dev/null 2>&1; then
        echo 'ERROR: pandoc not installed!'
        exit 1
fi

PANVIMDOC_DIR="$(mktemp -d /tmp/tmp-panvimdoc.XXXXXXXX)"
trap 'rm -rf "${PANVIMDOC_DIR}"' 0 1 15

echo 'Setting up panvimdoc ...'
git clone "https://github.com/kdheepak/panvimdoc" "${PANVIMDOC_DIR}"

rm -rvf ./doc
mkdir -pv ./doc
panvimdoc() {
        echo '' # Only for easier to read terminal output.
        bash "${PANVIMDOC_DIR}"/panvimdoc.sh "${@}" || exit 1
}

panvimdoc \
        --project-name 'neopywal' \
        --input-file ./README.md \
        --toc true \
        --demojify true \
        --treesitter true \
        --vim-version "nvim >= 0.8.0" \
        --description '(Neo)pywal for (Neo)vim'

find ./docs -type f ! -name "$(printf "*\n*")" -name '*.md' |
        while IFS= read -r file; do
                section=$(basename "${file}" .md)
                desc="$(basename "${file%.md}" | sed "s/-/ /g; s/[^ ]*/\u&/g")"

                panvimdoc \
                        --toc false \
                        --demojify true \
                        --treesitter true \
                        --shift-heading-level-by -1 \
                        --input-file "${file}" \
                        --project-name "${section}" \
                        --description "${desc}" \
                        --vim-version "nvim >= 0.8.0" || exit 1

                sed "s/\*${section}.txt\*/\*${section}\*/g" ./doc/"${section}.txt" >./doc/"tmp-${section}" || exit 1
                mv -vf ./doc/"tmp-${section}" ./doc/"${section}.txt" || exit 1
        done

nvim --headless \
        -c 'echo "Generating helptags ...\n"' \
        -c 'helptags ./doc' \
        -c 'echo "Helptags generated.\n"' \
        -c 'quit' || exit 1
