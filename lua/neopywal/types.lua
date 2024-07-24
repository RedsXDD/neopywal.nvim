---@alias ThemeStyles "dark" | "light" | nil
---@alias HighlightStyles "bold" | "underline" | "undercurl" | "underdouble" | "underdotted" | "underdashed" | "strikethrough" | "reverse" | "inverse" | "italic" | "standout" | "altfont" | "nocombine" | "NONE"

---@class Neopywal
---@field compiler CompilerOptions
---@field default_options NeopywalOptions
---@field options NeopywalOptions
---@field current_style ThemeStyles
---@field get_colors fun(theme_style: ThemeStyles?): table
---@field load fun(theme_style: ThemeStyles?)
---@field setup fun(user_config: NeopywalOptions?)

---@class CompilerOptions
---@field path_sep string
---@field filename string
---@field compile_path string

---@class NeopywalOptions
---@field use_wallust boolean?
---@field colorscheme_file string
---@field use_palette string?
---@field transparent_background boolean?
---@field custom_colors table?
---@field custom_highlights table?
---@field dim_inactive boolean?
---@field terminal_colors boolean?
---@field show_end_of_buffer boolean?
---@field show_split_lines boolean?
---@field no_italic boolean?
---@field no_bold boolean?
---@field no_underline boolean?
---@field no_undercurl boolean?
---@field no_strikethrough boolean?
---@field styles NeopywalStyles?
---@field default_fileformats boolean?
---@field default_plugins boolean?
---@field fileformats NeopywalFileformats?
---@field plugins NeopywalPlugins?

---@class NeopywalStyles
---@field comments HighlightStyles[]?
---@field conditionals HighlightStyles[]?
---@field loops HighlightStyles[]?
---@field functions HighlightStyles[]?
---@field keywords HighlightStyles[]?
---@field includes HighlightStyles[]?
---@field strings HighlightStyles[]?
---@field variables HighlightStyles[]?
---@field numbers HighlightStyles[]?
---@field booleans HighlightStyles[]?
---@field types HighlightStyles[]?
---@field operators HighlightStyles[]?
---@field lsp NeopywalPluginsLSP?

---@class NeopywalFileformats
---@field c_cpp boolean?
---@field c_sharp boolean?
---@field clojure boolean?
---@field cmake boolean?
---@field common_lisp boolean?
---@field css boolean?
---@field dart boolean?
---@field diff boolean?
---@field elixir boolean?
---@field erlang boolean?
---@field git_commit boolean?
---@field go boolean?
---@field haskell boolean?
---@field help boolean?
---@field html boolean?
---@field ini boolean?
---@field java boolean?
---@field javascript boolean?
---@field javascript_react boolean?
---@field json boolean?
---@field kotlin boolean?
---@field latex boolean?
---@field less boolean?
---@field lua boolean?
---@field makefile boolean?
---@field markdown boolean?
---@field matlab boolean?
---@field objectivec boolean?
---@field ocaml boolean?
---@field perl boolean?
---@field php boolean?
---@field powershell boolean?
---@field python boolean?
---@field restructuredtext boolean?
---@field ruby boolean?
---@field rust boolean?
---@field sass boolean?
---@field scala boolean?
---@field shell boolean?
---@field swift boolean?
---@field toml boolean?
---@field typescript boolean?
---@field viml boolean?
---@field xml boolean?
---@field yaml boolean?
---@field zsh boolean?

---@class NeopywalPlugins
---@field aerial boolean?
---@field alpha boolean?
---@field coc boolean?
---@field colorful_winsep NeopywalPluginsColorful_winsep | boolean?
---@field dashboard boolean?
---@field flash NeopywalPluginsFlash | boolean?
---@field git_gutter boolean?
---@field gitsigns boolean?
---@field indent_blankline NeopywalPluginsIndent_blankline | boolean?
---@field lazy boolean?
---@field lazygit boolean?
---@field lsp NeopywalPluginsLSP?
---@field neotree boolean?
---@field netrw boolean?
---@field noice boolean?
---@field notify boolean?
---@field nvim_cmp boolean?
---@field symbols_outline boolean?
---@field telescope NeopywalPluginsTelescope | boolean?
---@field treesitter boolean?
---@field undotree boolean?
---@field which_key boolean?
---@field mini NeopywalPluginsMiniNvim?

---@class NeopywalPluginsColorful_winsep
---@field enabled boolean
---@field color string?

---@class NeopywalPluginsFlash
---@field enabled boolean
---@field style HighlightStyles[]?

---@class NeopywalPluginsIndent_blankline
---@field enabled boolean
---@field scope_color string?
---@field colored_indent_levels boolean?

---@class NeopywalPluginsLSP
---@field enabled boolean
---@field virtual_text NeopywalPluginsLSPVirtualText?
---@field underlines NeopywalPluginsLSPUnderlines?
---@field inlay_hints NeopywalPluginsLSPInlayHints?

---@class NeopywalPluginsLSPVirtualText
---@field errors HighlightStyles[]?
---@field hints HighlightStyles[]?
---@field information HighlightStyles[]?
---@field ok HighlightStyles[]?
---@field warnings HighlightStyles[]?
---@field unnecessary HighlightStyles[]?

---@class NeopywalPluginsLSPUnderlines
---@field errors HighlightStyles[]?
---@field hints HighlightStyles[]?
---@field information HighlightStyles[]?
---@field ok HighlightStyles[]?
---@field warnings HighlightStyles[]?

---@class NeopywalPluginsLSPInlayHints
---@field background boolean?
---@field style HighlightStyles[]?

---@class NeopywalPluginsTelescope
---@field enabled boolean
---@field style "classic" | "nvchad" | nil?

---@class NeopywalPluginsMiniNvim
---@field animate boolean?
---@field clue boolean?
---@field completion NeopywalPluginsMiniCompletion | boolean?
---@field cursorword NeopywalPluginsMiniCursorword | boolean?
---@field deps boolean?
---@field diff boolean?
---@field files boolean?
---@field hipatterns NeopywalPluginsMiniHipatterns | boolean?
---@field icons boolean?
---@field indentscope NeopywalPluginsMiniIndentscope | boolean?
---@field jump NeopywalPluginsMiniJump | boolean?
---@field jump2d NeopywalPluginsMiniJump | boolean?
---@field map boolean?
---@field notify boolean?
---@field operators boolean?
---@field pick boolean?
---@field starter boolean?
---@field statusline NeopywalPluginsMiniStatusline | boolean?
---@field surround boolean?
---@field tabline boolean?
---@field test boolean?
---@field trailspace NeopywalPluginsMiniTrailspace | boolean?

---@class NeopywalPluginsMiniCompletion
---@field enabled boolean
---@field parameter_style HighlightStyles[]?

---@class NeopywalPluginsMiniCursorword
---@field enabled boolean
---@field style HighlightStyles[]?

---@class NeopywalPluginsMiniHipatterns
---@field enabled boolean
---@field style NeopywalPluginsHipatternsStyles?

---@class NeopywalPluginsHipatternsStyles
---@field fixme HighlightStyles[]?
---@field hack HighlightStyles[]?
---@field note HighlightStyles[]?
---@field todo HighlightStyles[]?

---@class NeopywalPluginsMiniIndentscope
---@field enabled boolean
---@field scope_color string?

---@class NeopywalPluginsMiniJump
---@field enabled boolean
---@field style HighlightStyles[]?

---@class NeopywalPluginsMiniJump2d
---@field enabled boolean
---@field style HighlightStyles[]?

---@class NeopywalPluginsMiniStatusline
---@field enabled boolean
---@field mode_colors table<string, string>?

---@class NeopywalPluginsMiniTrailspace
---@field enabled boolean
---@field color string?

---@class NeopywalPluginsBarbecue
---@field default_options NeopywalPluginsBarbecueOptions
---@field options NeopywalPluginsBarbecueOptions
---@field setup fun(user_config: NeopywalPluginsBarbecueOptions?)
---@field get fun(): table

---@class NeopywalPluginsBarbecueOptions
---@field dim_background boolean?
---@field dim_context boolean?
---@field dim_dirname boolean?
---@field hide_separator boolean?
---@field basename_style HighlightStyles[]?
---@field context_style HighlightStyles[]?
---@field dirname_style HighlightStyles[]?
---@field theme table | function<table>
