--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`
local lush = require('lush')
local hsl = lush.hsl

local latte = {
  rosewater = "#dc8a78",
  flamingo = "#dd7878",
  pink = "#ea76cb",
  mauve = "#8839ef",
  red = "#d20f39",
  maroon = "#e64553",
  peach = "#fe640b",
  yellow = "#df8e1d",
  green = "#40a02b",
  teal = "#179299",
  sky = "#04a5e5",
  saphire = "#209fb5",
  blue = "#1e66f5",
  lavender = "#7287fd",
  -- text = "#4c4f69",
  -- subtext1 = "#5c5f77",
  -- subtext0 = "#6c6f85",
  -- overlay2 = "#7c7f93",
  -- overlay1 = "#8c8fa1",
  -- overlay0 = "#9ca0b0",
  -- surface2 = "#acb0be",
  -- surface1 = "#bcc0cc",
  -- surface0 = "#ccd0da",
  -- base = "#eff1f5",
  -- mantle = "#e6e9ef",
  -- crust = "#dce0e8",
}

local mocha = {
  rosewater = hsl("#f5e0dc"),
  flamingo = hsl("#f2cdcd"),
  pink = hsl("#f5c2e7"),
  mauve = hsl("#cba6f7"),
  red = hsl("#f37ba8"),
  maroon = hsl("#eba0ac"),
  peach = hsl("#fab387"),
  yellow = hsl("#f9e2af"),
  green = hsl("#abe9b3"),
  teal = hsl("#94e2d5"),
  sky = hsl("#89dceb"),
  saphire = hsl("#74c7ec"),
  blue = hsl("#89b4fa"),
  lavender = hsl("#b4befe"),
  text = hsl("#cdd6f4"),
  subtext1 = hsl("#bac2de"),
  subtext0 = hsl("#a6adc8"),
  overlay2 = hsl("#9399b2"),
  overlay1 = hsl("#7f849c"),
  overlay0 = hsl("#6c7086"),
  surface2 = hsl("#585b70"),
  surface1 = hsl("#45475a"),
  surface0 = hsl("#313244"),
  base = hsl("#1e1e2e"),
  mantle = hsl("#181825"),
  crust = hsl("#11111b"),
}

local custom = {
  black = hsl("#0f0f17"),
  -- black = catppuccin_mocha.base.darken(50),
  verdant_green = hsl("#37a3a5"),

  red = hsl("#E95678"),
  baby_pink = hsl("#f86587"),
  pink = hsl("#ff7eb6"),
  horizon_orange = hsl("#F09383"),
  orange = hsl("#ff9e64"),
  yellow = hsl("#f6ca6b"),
  tokyodark_green = hsl("#95c561"),
  pale_yellow_green = hsl("#e5fcc2"),
  yellow_green = hsl("#BAE881"),
  pale_green = hsl("#c7f9cc"),
  dead_green = hsl("#9de0ad"),
  green = hsl("#80ed99"),
  green1 = hsl("#42be65"),
  vibrant_green = hsl("#2EE6A6"),
  teal = hsl("#1abc9c"),
  green_cyan = hsl("#25B2BC"),
  cyan = hsl("#18B8D9"),
  pale_blue = hsl("#A4C8DE"),
  light_blue = hsl("#7dcfff"),
  blue = hsl("#78a9ff"),
  nord_blue = hsl("#6b9cf2"),
  purple = hsl("#be95ff"),
  dark_purple = hsl("#9d7cd8"),
}

local derivative = {
  darker_black = custom.black.darken(10),
  black2 = custom.black.lighten(6),
}

local base00 = hsl("#101418") -- default bg
local base01 = hsl("#1a1d21") -- lighter bg
local base02 = hsl("#23262a") -- selection bg
local base03 = hsl("#2b2e32") -- comment, line hl
local base04 = hsl("#323539") -- dark fg
local base05 = hsl("#f2f4f8")
local base06 = hsl("#ffffff")
local base07 = hsl("#d4d4d5") -- light bg (nou)
local base08 = hsl("#78a9ff") -- variables
local base09 = hsl("#f6ca6b") -- interger, boolean, constant
local base0A = hsl("#ff7eb6") -- classes, search txt bg
local base0B = hsl("#80ed99") -- string
local base0C = hsl("#7dcfff") -- support, regex
local base0D = hsl("#38a3a5") -- func mthd
local base0E = hsl("#be95ff") -- keyword
local base0F = hsl("#A4C8DE") -- deprecated? syntax?

local white = hsl("#ffffff")
local darker_white = hsl("#737579") --50% darker than white
local muted_foreground = hsl("#858d99")

local black = hsl("#101418") --  nvim bg
local darker_black = hsl("#0a0d11") --6% darker than black
local black2 = hsl("#191d22") --6% lighter than black
local one_bg = hsl("#212428") --10% ltb
local one_bg2 = hsl("#292c30") --19% ltb
local one_bg3 = hsl("#33363a") --27% ltb
local grey = hsl("#3e4145") --40% ltb (the % here depends)
local grey_fg = hsl("#45484c") --10% ltg
local grey_fg2 = hsl("#4a4d51") --20% ltg
local light_grey = hsl("#525559") --28% ltg

local red = hsl("#E95678")
local baby_pink = hsl("#f86587") --15% lighter than red or any
local pink = hsl("#ff7eb6")
local catppuccin_flamingo = hsl("#F2CDCD")
local horizon_orange = hsl("#F09383")
local orange = hsl("#ff9e64")
local yellow = hsl("#f6ca6b")
local tokyodark_green = hsl("#95c561")
local pale_yellow_green = hsl("#e5fcc2")
local yellow_green = hsl("#BAE881") -- string
local pale_green = hsl("#c7f9cc")
local catppuccin_green = hsl("#ABE9B3")
local dead_green = hsl("#9de0ad")
local light_green = hsl("#80ed99")
local green = hsl("#42be65")
local vibrant_green = hsl("#2EE6A6")
local teal = hsl("#1abc9c")
local green_cyan = hsl("#25B2BC")
local cyan = hsl("#18B8D9")
local pale_blue = hsl("#A4C8DE")
local light_blue = hsl("#7dcfff")
local blue = hsl("#78a9ff")
local nord_blue = hsl("#6b9cf2") -- 13% darker than blue
local purple = hsl("#be95ff")
local dark_purple = hsl("#9d7cd8") --
local catppuccin_lavender = hsl("#B4BEFE")

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    -- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
    -- groups, mostly used for styling UI elements.
    -- Comment them out and add your own properties to override the defaults.
    -- An empty definition `{}` will clear all styling, leaving elements looking
    -- like the 'Normal' group.
    -- To be able to link to a group, it must already be defined, so you may have
    -- to reorder items as you go.

    --
    -- See :h highlight-groups
    --

    TabLine = { bg = mocha.mantle, fg = mocha.surface1 },
    TabLineFill = { bg = mocha.mantle, fg = mocha.surface1 },

    ColorColumn    { bg = mocha.surface0 }, -- Columns set with 'colorcolumn'
    Conceal        { fg = mocha.overlay1 }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor         { fg = custom.base, bg = mocha.text }, -- Character under the cursor
    CurSearch      { bg = red, fg = custom.black }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
    lCursor        { fg = custom.black, bg = mocha.text}, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
    -- CursorColumn   { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    -- CursorLine     { }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    -- Directory      { }, -- Directory names (and other special names in listings)
    -- DiffAdd        { }, -- Diff mode: Added line |diff.txt|
    -- DiffChange     { }, -- Diff mode: Changed line |diff.txt|
    -- DiffDelete     { }, -- Diff mode: Deleted line |diff.txt|
    -- DiffText       { }, -- Diff mode: Changed text within a changed line |diff.txt|
    -- EndOfBuffer    { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    -- TermCursor     { }, -- Cursor in a focused terminal
    -- TermCursorNC   { }, -- Cursor in an unfocused terminal
    ErrorMsg       { fg = custom.red, bg = custom.black}, -- Error messages on the command line
    -- VertSplit      { }, -- Column separating vertically split windows
    -- Folded         { }, -- Line used for closed folds
    -- FoldColumn     { }, -- 'foldcolumn'
    -- SignColumn     { }, -- Column where |signs| are displayed
    IncSearch      { bg = base09, fg = base01}, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute     { bg = base00, fg = base01 }, -- |:substitute| replacement text highlighting
    LineNr         { fg = mocha.overlay0, gui="italic" }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    -- LineNrAbove    { }, -- Line number for when the 'relativenumber' option is set, above the cursor line
    -- LineNrBelow    { }, -- Line number for when the 'relativenumber' option is set, below the cursor line
    CursorLineNr   { fg = base0B }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    -- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
    -- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
    -- MatchParen     { }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- ModeMsg        { }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea        { }, -- Area for messages and cmdline
    -- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    -- MoreMsg        { }, -- |more-prompt|
    -- NonText        { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal         { fg = base06, bg = base00}, -- Normal text
    NormalFloat    { Normal }, -- Normal text in floating windows.
    -- FloatBorder    { }, -- Border of floating windows.
    -- FloatTitle     { }, -- Title of floating windows.
    -- NormalNC       { }, -- normal text in non-current windows
    -- Pmenu          { }, -- Popup menu: Normal item.
    -- PmenuSel       { }, -- Popup menu: Selected item.
    -- PmenuKind      { }, -- Popup menu: Normal item "kind"
    -- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
    -- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
    -- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
    -- PmenuSbar      { }, -- Popup menu: Scrollbar.
    -- PmenuThumb     { }, -- Popup menu: Thumb of the scrollbar.
    -- Question       { }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine   { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search         { fg = base01, bg = base0A }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    -- SpecialKey     { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad       { sp = red, gui="undercurl"}, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap       { sp = yellow, gui="undercurl"}, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal     { sp = blue, gui="undercurl"}, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare      { sp = green, gui="undercurl"}, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    StatusLine     { bg = base01, fg = base06}, -- Status line of current window
    -- StatusLineNC   { }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    -- TabLine        { }, -- Tab pages line, not active tab page label
    -- TabLineFill    { }, -- Tab pages line, where there are no labels
    -- TabLineSel     { }, -- Tab pages line, active tab page label
    -- Title          { }, -- Titles for output from ":set all", ":autocmd" etc.
    Visual         { bg = base0B, fg = base00 }, -- Visual mode selection
    VisualNOS      { Visual }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg     { fg = yellow}, -- Warning messages
    Whitespace     { fg = base00.lighten(80) }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- Winseparator   { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    -- WildMenu       { }, -- Current match in 'wildmenu' completion
    -- WinBar         { }, -- Window bar of current window
    -- WinBarNC       { }, -- Window bar of not-current windows

    -- Common vim syntax groups used for all kinds of code and markup.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name
    --
    -- Uncomment and edit if you want more specific syntax highlighting.

    Comment        { fg = mocha.overlay0, gui="italic"}, -- Any comment

    -- Constant       { }, -- (*) Any constant
    -- String         { }, --   A string constant: "this is a string"
    -- Character      { }, --   A character constant: 'c', '\n'
    -- Number         { }, --   A number constant: 234, 0xff
    -- Boolean        { }, --   A boolean constant: TRUE, false
    -- Float          { }, --   A floating point constant: 2.3e10

    -- Identifier     { }, -- (*) Any variable name
    -- Function       { }, --   Function name (also: methods for classes)

    Statement      { fg = base08 }, -- (*) Any statement
    Conditional    { fg = base0E }, --   if, then, else, endif, switch, etc.
    -- Repeat         { }, --   for, do, while, etc.
    -- Label          { }, --   case, default, etc.
    -- Operator       { }, --   "sizeof", "+", "*", etc.
    -- Keyword        { }, --   any other keyword
    -- Exception      { }, --   try, catch, throw

    -- PreProc        { }, -- (*) Generic Preprocessor
    -- Include        { }, --   Preprocessor #include
    -- Define         { }, --   Preprocessor #define
    -- Macro          { }, --   Same as Define
    -- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

    -- Type           { }, -- (*) int, long, char, etc.
    -- StorageClass   { }, --   static, register, volatile, etc.
    -- Structure      { }, --   struct, union, enum, etc.
    -- Typedef        { }, --   A typedef

    -- Special        { }, -- (*) Any special symbol
    -- SpecialChar    { }, --   Special character in a constant
    -- Tag            { }, --   You can use CTRL-] on this
    -- Delimiter      { }, --   Character that needs attention
    -- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
    -- Debug          { }, --   Debugging statements

    -- Underlined     { gui = "underline" }, -- Text that stands out, HTML links
    -- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    -- Error          { }, -- Any erroneous construct
    -- Todo           { }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- LspReferenceText            { } , -- Used for highlighting "text" references
    -- LspReferenceRead            { } , -- Used for highlighting "read" references
    -- LspReferenceWrite           { } , -- Used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- DiagnosticError            { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticWarn             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticInfo             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticHint             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticOk               { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
    -- DiagnosticVirtualTextOk    { } , -- Used for "Ok" diagnostic virtual text.
    -- DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
    -- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
    -- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
    -- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
    -- DiagnosticUnderlineOk      { } , -- Used to underline "Ok" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
    -- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.

    -- Tree-Sitter syntax groups.
    --
    -- See :h treesitter-highlight-groups, some groups may not be listed,
    -- submit a PR fix to lush-template!
    --
    -- Tree-Sitter groups are defined with an "@" symbol, which must be
    -- specially handled to be valid lua code, we do this via the special
    -- sym function. The following are all valid ways to call the sym function,
    -- for more details see https://www.lua.org/pil/5.html
    --
    -- sym("@text.literal")
    -- sym('@text.literal')
    -- sym"@text.literal"
    -- sym'@text.literal'
    --
    -- For more information see https://github.com/rktjmp/lush.nvim/issues/109

    -- sym"@text.literal"      { }, -- Comment
    -- sym"@text.reference"    { }, -- Identifier
    -- sym"@text.title"        { }, -- Title
    -- sym"@text.uri"          { }, -- Underlined
    -- sym"@text.underline"    { }, -- Underlined
    -- sym"@text.todo"         { }, -- Todo
    -- sym"@comment"           { }, -- Comment
    -- sym"@punctuation"       { }, -- Delimiter
    -- sym"@constant"          { }, -- Constant
    -- sym"@constant.builtin"  { }, -- Special
    -- sym"@constant.macro"    { }, -- Define
    -- sym"@define"            { }, -- Define
    -- sym"@macro"             { }, -- Macro
    -- sym"@string"            { }, -- String
    -- sym"@string.escape"     { }, -- SpecialChar
    -- sym"@string.special"    { }, -- SpecialChar
    -- sym"@character"         { }, -- Character
    -- sym"@character.special" { }, -- SpecialChar
    -- sym"@number"            { }, -- Number
    -- sym"@boolean"           { }, -- Boolean
    -- sym"@float"             { }, -- Float
    -- sym"@function"          { }, -- Function
    -- sym"@function.builtin"  { }, -- Special
    -- sym"@function.macro"    { }, -- Macro
    -- sym"@parameter"         { }, -- Identifier
    -- sym"@method"            { }, -- Function
    -- sym"@field"             { }, -- Identifier
    -- sym"@property"          { }, -- Identifier
    -- sym"@constructor"       { }, -- Special
    -- sym"@conditional"       { }, -- Conditional
    -- sym"@repeat"            { }, -- Repeat
    -- sym"@label"             { }, -- Label
    -- sym"@operator"          { }, -- Operator
    -- sym"@keyword"           { }, -- Keyword
    -- sym"@exception"         { }, -- Exception
    -- sym"@variable"          { }, -- Identifier
    -- sym"@type"              { }, -- Type
    -- sym"@type.definition"   { }, -- Typedef
    -- sym"@storageclass"      { }, -- StorageClass
    -- sym"@structure"         { }, -- Structure
    -- sym"@namespace"         { }, -- Identifier
    -- sym"@include"           { }, -- Include
    -- sym"@preproc"           { }, -- PreProc
    -- sym"@debug"             { }, -- Debug
    -- sym"@tag"               { }, -- Tag

    -- Extra
    -- IndentBlanklineSpaceChar = { fg = C.one_bg2 },
  }
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
