# Changelog

## [1.2.0](https://github.com/RedsXDD/neopywal.nvim/compare/v1.1.1...v1.2.0) (2024-07-12)


### Features

* **plugins/feline:** proper feline.nvim support ([8b60526](https://github.com/RedsXDD/neopywal.nvim/commit/8b605260297a100e7f611538fc614a178846b67f))


### Bug Fixes

* **feline:** improper gitsigns handling ([0b0b7e4](https://github.com/RedsXDD/neopywal.nvim/commit/0b0b7e48e21716b3aebaa4bc46cef2b6195aa8f2))
* **feline:** proper git branch spacing ([bc44124](https://github.com/RedsXDD/neopywal.nvim/commit/bc4412455710adce831d937a7562b6cfbf1460fc))

## [1.1.1](https://github.com/RedsXDD/neopywal.nvim/compare/v1.1.0...v1.1.1) (2024-07-08)


### Bug Fixes

* "M.load()" not respecting "vim.o.background" ([0754ff3](https://github.com/RedsXDD/neopywal.nvim/commit/0754ff354046b10b8d7a93c8951215b8b840f621))
* get_colors cache_dir on windows ([2f76022](https://github.com/RedsXDD/neopywal.nvim/commit/2f76022b5256a53f700225384ed1b2c1e5ae1e18))

## [1.1.0](https://github.com/RedsXDD/neopywal.nvim/compare/v1.0.0...v1.1.0) (2024-07-06)


### Features

* "vim.o.background" support ([2b7b296](https://github.com/RedsXDD/neopywal.nvim/commit/2b7b296d01544c9cecf2b497172c1a6d04b8d831))
* improve notifications ([e31ca4a](https://github.com/RedsXDD/neopywal.nvim/commit/e31ca4a2c0c70412a4738fc9df2963f907eef3eb))


### Bug Fixes

* **compiler:** malformed string formatting ([f8d3bbb](https://github.com/RedsXDD/neopywal.nvim/commit/f8d3bbb4416be079cc31a1210b483d3eb72bf8eb))
* running concurrent M.load() calls ([e78a4f3](https://github.com/RedsXDD/neopywal.nvim/commit/e78a4f30ba2675934d6fcff4e66ba602b1d8b9e7))


### Reverts

* "refactor: local default_options table" ([f6ab6b0](https://github.com/RedsXDD/neopywal.nvim/commit/f6ab6b0353da241f0dc1d6d02138b003f88e0d63))

## 1.0.0 (2024-07-04)


### ⚠ BREAKING CHANGES

* since all the files having been moved, many "require" function calls have to be updated.
* **plugins:** drop ALE support
* **get_colors:** remove "transparent" key
* colorscheme compiler
* **init.lua:** Renamed `terminal` option to `terminal_colors`.
* **init.lua:** Renamed `transparent` option to `transparent_background`.
* **bufferline.lua:** Added setup function for ease of custom user configuration.
* **bufferline.lua:** Improved bufferline theming.

### Features

* `colorscheme_file` option ([f374f5d](https://github.com/RedsXDD/neopywal.nvim/commit/f374f5d25e4bc9ecd457f01d31557de61246e02d))
* `show_split_lines` option ([41a22b3](https://github.com/RedsXDD/neopywal.nvim/commit/41a22b3a0dff9b7101833b020044c13ad0964335))
* Added `show_end_of_buffer` option. ([a253784](https://github.com/RedsXDD/neopywal.nvim/commit/a2537846841be684e8f3a57843e5cbd1fb355bfd))
* Added additional styling options. ([e9a518a](https://github.com/RedsXDD/neopywal.nvim/commit/e9a518a71ab98dc96718c85c48458d2efb295ca4))
* added background dim option. ([aada680](https://github.com/RedsXDD/neopywal.nvim/commit/aada68043bc417886015f1b10247c8c9309770e2))
* added CmpItemKind highlight groups. ([b96b5c5](https://github.com/RedsXDD/neopywal.nvim/commit/b96b5c52297ac34649f8b2263814075293b9d7c9))
* Added colorizer.lua ([65bed53](https://github.com/RedsXDD/neopywal.nvim/commit/65bed53ab3b4324c1657cbb00f97a98e94928d4c))
* Added custom_highlights setting. ([42a517c](https://github.com/RedsXDD/neopywal.nvim/commit/42a517c8ffa6ef822b20acf8a2201dab13b61d2f))
* Added extra nvim-notify plugin options/highlights. ([3fd0acf](https://github.com/RedsXDD/neopywal.nvim/commit/3fd0acf86a6349a77aed84257f1fdd74e65530b2))
* Added lazygit support. ([5427628](https://github.com/RedsXDD/neopywal.nvim/commit/5427628888c137a92a8b2d51f82d525507882a53))
* Added Noice.nvim plugin integration. ([74b7324](https://github.com/RedsXDD/neopywal.nvim/commit/74b73244c00a88661dd9b3ead1b211056fe2e6bd))
* Added Ok diagnostic highlights. ([a43730b](https://github.com/RedsXDD/neopywal.nvim/commit/a43730bd13a2f89ee1bd1ba2cc65c625f70fc3b9))
* Added support for custom user color variables. ([e7fbb66](https://github.com/RedsXDD/neopywal.nvim/commit/e7fbb66683ab027bb39c04ffe43b240e38efe14d))
* added support for user color customization. ([604686f](https://github.com/RedsXDD/neopywal.nvim/commit/604686ff5ec56c9584574d116b4023d6d266a49e))
* added terminal highlights. ([0da7454](https://github.com/RedsXDD/neopywal.nvim/commit/0da74545973c882d65d7f89e2c6bd5050b127c08))
* Added terminal option for applying terminal colorscheme. ([98f9a76](https://github.com/RedsXDD/neopywal.nvim/commit/98f9a76143dadc28e0d7ea1086df1782736c5a5a))
* added transparent background support. ([b7b795e](https://github.com/RedsXDD/neopywal.nvim/commit/b7b795e4c55ef50d85a3699011b85723539e74b3))
* added wallust support. ([e6d578c](https://github.com/RedsXDD/neopywal.nvim/commit/e6d578ccc6b5a6ebaa5ba47ddf7a4ca7af1c0930))
* **bufferline:** add `indicator` highlights ([063ef45](https://github.com/RedsXDD/neopywal.nvim/commit/063ef453bbb4bfc9d0bf50901b04d722c7882146))
* **bufferline:** improve `trunc_marker` bg ([031b6ac](https://github.com/RedsXDD/neopywal.nvim/commit/031b6ac2903c91351383d36926fbb5990febfa95))
* colorscheme compiler ([0c4a6c4](https://github.com/RedsXDD/neopywal.nvim/commit/0c4a6c44e942502bd27230f40bd0576fb2b16dd8))
* **editor:** improve "String" ([cb9d234](https://github.com/RedsXDD/neopywal.nvim/commit/cb9d234a6306b71b4c56c52c21b89c8543a87656))
* **editor:** improve diff highlights ([921c3b2](https://github.com/RedsXDD/neopywal.nvim/commit/921c3b2fc3ac5b3016d1362de9cd3190878381a2))
* **plugins:** improve ALE highlights ([3a71c8b](https://github.com/RedsXDD/neopywal.nvim/commit/3a71c8ba9e62dc3c25c39f63bc14e0e49236d4a3))
* **plugins:** improve Coc highlights ([18b6c01](https://github.com/RedsXDD/neopywal.nvim/commit/18b6c01092a240e2e0776279aaabd264ae3fef98))
* **plugins:** improve dashboard-nvim highlights ([728219b](https://github.com/RedsXDD/neopywal.nvim/commit/728219b3a43f3955c745ed11a50543ac79e506da))
* **plugins:** improve lsp highlights ([99c5e07](https://github.com/RedsXDD/neopywal.nvim/commit/99c5e0766117893f662d29044b4af9fc904cba04))
* **plugins:** improve netrw highlights ([2fcd752](https://github.com/RedsXDD/neopywal.nvim/commit/2fcd75248bfd765175503e06c242d09f5638821e))
* **plugins:** improve nvim_cmp highlights ([2504f53](https://github.com/RedsXDD/neopywal.nvim/commit/2504f536e3948c48da2a35282bc5132762e51b4a))
* **plugins:** improved bg color for TelescopeSelectionCaret ([e958d18](https://github.com/RedsXDD/neopywal.nvim/commit/e958d1895afdd0ea3bf2534f4600ff8079af6dd8))
* **plugins:** improved neotree highlights ([b57f0f4](https://github.com/RedsXDD/neopywal.nvim/commit/b57f0f4b00278129d9ff18c6d85b46449608b092))
* **plugins:** improved Noice.nvim border colors ([32dd459](https://github.com/RedsXDD/neopywal.nvim/commit/32dd459028ce5a7d22d6a1bdaaf1a2e73e5309b2))
* **plugins:** match GitGutter hi with Diffs ([6f15542](https://github.com/RedsXDD/neopywal.nvim/commit/6f15542cb676a2dffe11272bec1fa495b71e60f0))
* treesitter disables "default_fileformats" ([9dc4ed9](https://github.com/RedsXDD/neopywal.nvim/commit/9dc4ed9a1a0d0d1feec18596dc7152872c37ec47))
* **util.lua:** Added M.blend() which blends two colors together to create a new color. ([2cd8a6a](https://github.com/RedsXDD/neopywal.nvim/commit/2cd8a6a04d03fbc3b253cb3916b0a17c8eba2c06))
* **util:** `hexToRgb()` is now a global function ([ac51def](https://github.com/RedsXDD/neopywal.nvim/commit/ac51def7f4f46dbe1071d126786d8723273fc250))


### Bug Fixes

* **bufferline.lua:** Fixed bg color for modified symbol not being transparent. ([99df911](https://github.com/RedsXDD/neopywal.nvim/commit/99df911e9fda12947d3c6cae08d709a43f7630e6))
* **bufferline.lua:** Fixed bg color of non-current buffers with diagnostic informations. ([70f94b0](https://github.com/RedsXDD/neopywal.nvim/commit/70f94b0341b7d70fa7aa31e043a0b47ac5c85689))
* **compiler:** err_path separator on windows ([c95d214](https://github.com/RedsXDD/neopywal.nvim/commit/c95d2141c5dff9c124b953a9afdcd390d9e35d1b))
* **editor.lua:** Fixed `Float` and `Pmenu` transparency not being properly setup with winblend/pumblend. ([9d65c9b](https://github.com/RedsXDD/neopywal.nvim/commit/9d65c9b35f6da944fa69d4d99c1acc3164178b8a))
* **editor.lua:** fixed diagnostic background colors not matching SignColumn color. ([6f5eba8](https://github.com/RedsXDD/neopywal.nvim/commit/6f5eba852d59c111d251df9677be2fa947d01620))
* **editor.lua:** Fixed float window transparency colors. ([1183ef6](https://github.com/RedsXDD/neopywal.nvim/commit/1183ef60e729d8ecf939bd30edd2b8af1345bb0e))
* **editor.lua:** Fixed NormalFloat hi not being properly transparent with transparent opt. ([dc3e063](https://github.com/RedsXDD/neopywal.nvim/commit/dc3e063b80b7310c9afcc6fddf837c3c4b860fb3))
* **editor.lua:** Fixed Pmenu transparency with winblend option. ([a20a66f](https://github.com/RedsXDD/neopywal.nvim/commit/a20a66f77e886d5724059520fbc82c2694f8d58c))
* **editor.lua:** Fixed pmenu/floating window transparencies with o.winblend/o.pumblend. ([b2d1bd3](https://github.com/RedsXDD/neopywal.nvim/commit/b2d1bd3381c88a5fcfd363b684ecd78a3fbe822b))
* **editory.lua:** Fixed NormalNC poor dim highlighting on transparent terminals. ([7f666c0](https://github.com/RedsXDD/neopywal.nvim/commit/7f666c00d34982b25b98210db1b5e2894d2272e5))
* fallback colors not being applied properly ([e194960](https://github.com/RedsXDD/neopywal.nvim/commit/e194960dd0f12292cb633536cb981c02af18c2e1))
* **init.lua:** Fixed background color on Neovide with transparent option enabled. ([b2cb625](https://github.com/RedsXDD/neopywal.nvim/commit/b2cb62578b26dc4e6183236f9f15b32409d77409))
* **init.lua:** Fixed neovide transparency settings not being properly applied. ([a23b035](https://github.com/RedsXDD/neopywal.nvim/commit/a23b035cd7000ad4c650bc948591985170ae49f2))
* **init.lua:** Fixed terminal colorscheme not being properly applied. ([f1ab268](https://github.com/RedsXDD/neopywal.nvim/commit/f1ab2683c2f511573bb77324c1d6f70bdc901de9))
* **init.lua:** Fixed vim.cmd.hi("clear") not being properly called. ([80741eb](https://github.com/RedsXDD/neopywal.nvim/commit/80741eb963d8dd2bfcf7f826c7cb900ef5ff4e2a))
* **plugins.lua:** Fixed Noice.nvim tranparent progress background being black. ([57fb800](https://github.com/RedsXDD/neopywal.nvim/commit/57fb800ccc1c2dd2f6623b82ef3612927a36fd4a))
* removed plugin dependent highlight links. ([aecc15f](https://github.com/RedsXDD/neopywal.nvim/commit/aecc15ffa216cb91c7af4dc714a14a1e0e16dad9))
* **util.lua:** Added safe color generation checks. ([e51bb51](https://github.com/RedsXDD/neopywal.nvim/commit/e51bb51dcc77f691bd40698c23bf2dba4e016096))
* **utils/color:** accepting negative factors ([8ceb795](https://github.com/RedsXDD/neopywal.nvim/commit/8ceb7956d333736e13d0848ec769e134e576417f))


### Performance Improvements

* limit sum_colors() table ([cf497de](https://github.com/RedsXDD/neopywal.nvim/commit/cf497deb38612b9cdf16fd290bc07da6fb85e69a))


### Code Refactoring

* **bufferline.lua:** Added setup function for ease of custom user configuration. ([c076ba2](https://github.com/RedsXDD/neopywal.nvim/commit/c076ba2151f0b62315b033ee49a26b2d49dd919a))
* **bufferline.lua:** Improved bufferline theming. ([309a0fd](https://github.com/RedsXDD/neopywal.nvim/commit/309a0fd4d620cfb7ca1d5ed5e031082263261b06))
* **get_colors:** remove "transparent" key ([d93f299](https://github.com/RedsXDD/neopywal.nvim/commit/d93f2999be5681d86ce37d304c4d9023a11c189a))
* **init.lua:** Renamed `terminal` option to `terminal_colors`. ([490cb40](https://github.com/RedsXDD/neopywal.nvim/commit/490cb40802cd45056bef0505fa8e73644b9c0ad7))
* **init.lua:** Renamed `transparent` option to `transparent_background`. ([47e3989](https://github.com/RedsXDD/neopywal.nvim/commit/47e398955a535795bcdea8c494ca753539b274ff))
* **plugins:** drop ALE support ([01e2a49](https://github.com/RedsXDD/neopywal.nvim/commit/01e2a498009fff836f1306dafdbda5e0523c9e9a))
* update directory structure ([539209e](https://github.com/RedsXDD/neopywal.nvim/commit/539209e711436664a88fa587f1f7f2e06b9103c9))
