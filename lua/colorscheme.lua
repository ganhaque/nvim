require("catppuccin").setup({
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  -- background = { -- :h background
  --   light = "latte",
  --   dark = "mocha",
  -- },
  transparent_background = false,
  term_colors = true, --default: false
  -- dim_inactive = {
  --   enabled = true,
  --   -- shade = "dark",
  --   shade = "white",
  --   percentage = 0.01,
  -- },
  no_italic = false, -- Force no italic
  no_bold = false, -- Force no bold
  -- styles = { --default
  --   comments = { "italic" },
  --   conditionals = { "italic" },
  --   loops = {},
  --   functions = {},
  --   keywords = {},
  --   strings = {},
  --   variables = {},
  --   numbers = {},
  --   booleans = {},
  --   properties = {},
  --   types = {},
  --   operators = {},
  -- },
  -- ayamir config
  styles = {
    -- comments = { "italic" },
    properties = { "italic" },
    functions = { "italic", "bold" },
    keywords = { "italic" },
    operators = { "bold" },
    conditionals = { "bold" },
    loops = { "bold" },
    -- booleans = { "bold", "italic" },
    booleans = { "bold" },
    numbers = {},
    types = {},
    strings = {},
    variables = {},
  },
  -- color_overrides = { --default
  -- },
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
    },
    lsp_trouble = true,
    lsp_saga = true,
    gitgutter = false,
    gitsigns = true,
    telescope = true,
    nvimtree = true,
    -- which_key = true, --hard to see
    indent_blankline = { enabled = true, colored_indent_levels = true },
    dashboard = true,
    neogit = false,
    vim_sneak = false,
    fern = false,
    barbar = false,
    markdown = true,
    lightspeed = false,
    ts_rainbow = true,
    mason = true,
    neotest = false,
    noice = false,
    -- hop = true, --color: red -> orange | blue -> teal
    illuminate = true,
    cmp = true,
    dap = { enabled = true, enable_ui = true },
    notify = true,
    symbols_outline = false,
    coc_nvim = false,
    leap = false,
    neotree = { enabled = false, show_root = true, transparent_panel = false },
    telekasten = false,
    mini = false,
    aerial = false,
    vimwiki = true,
    beacon = false,
    navic = { enabled = false },
    overseer = false,
    fidget = true,
  },

  color_overrides = {
    mocha = {
      --comment = ayamir but i prefer default
      rosewater = "#F5E0DC", --default
      flamingo = "#F2CDCD", --default
      pink = "#F5C2E7", --default
      mauve = "#9D7DD8", --prev: #DDB6F2
      -- red = "#F28FAD",
      maroon = "#DA4B4A", --ayamir: #E8A2AF --now: nvchad baby-pink --prev: #ffa5c3
      -- peach = "#FF9D64", --prev: #F8BD96
      peach = "#BAE881", --prev: #F8BD96
      yellow = "#FAE3B0",
      green = "#ABE9B3",
      -- blue = "#96CDFB",
      sky = "#89DCEB",
      teal = "#B5E8E0",
      -- lavender = "#C9CBFF",

      -- base = "#101317",
      -- seems to be used for the out of focus window so match it with base00
      base = "#0f0f17";

      -- mantle = "#1A1826",
      -- crust = "#161320",

      base00 = "#0f0f17"; --default bg
      base01 = "#282737"; --lighter bg (status bar, line number, folding marks)
      base02 = "#2f2e3e"; --selection bg
      base03 = "#383747"; --comments, invisibles, line highlighting
      base04 = "#414050";
      base05 = "#CDD6F4";
      base06 = "#d7def6"; -- 20% lighter than 06
      base07 = "#e6ebfa"; -- 50% lighter than 05

      base08 = "#78a9ff"; -- variables
      base09 = "#f6ca6b"; -- interger, boolean, constant
      base0A = "#ff7eb6"; -- classes, search txt bg
      base0B = "#80ed99";
      base0C = "#7dcfff"; -- support, regex
      base0D = "#38a3a5";
      base0E = "#be95ff"; -- keyword
      base0F = "#93baff"; -- deprecated? syntax? -- 20% lighter blue (base08)

      white = "#D9E0EE";
      darker_black = "#0d0c14";
      black = "#0f0f17"; --default bg
      black2 = "#13121a"; -- 6% dtb
      one_bg = "#2d2c3c"; -- 10% ltb
      one_bg2 = "#363545"; -- 19% ltb
      one_bg3 = "#3e3d4d"; -- 27% ltb
      grey = "#474656"; -- 40% ltb (depends)
      grey_fg = "#4e4d5d"; -- 10% ltg
      grey_fg2 = "#555464"; -- 20% ltg
      light_grey = "#605f6f"; -- 28% ltg

      -- base0D = "#31748f",
      -- base0B = "#9ccfd8",
      -- base0B = "#33b1ff";

      -- base0A = "#ff7eb6", -- classes, search txt bg
      -- base0A = "#e95678", -- classes, search txt bg
    },
  },
  -- custom_highlights = function (colors)
  --   return {
  --     -- Comment = { fg = colors.flamingo }, --example
  --   }
  -- end,
  -- integrations = { --default
  --   cmp = true,
  --   gitsigns = true,
  --   nvimtree = true,
  --   telescope = true,
  --   notify = false,
  --   mini = false,
  --   -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  -- },

  highlight_overrides = {
    mocha = function(C)
      return {
        IblIndent = { fg = C.surface0 },
        IblScope = { fg = C.text },
        -- TablineFill = { bg = C.base01 },
        -- TabLineSel = { fg = C.base0D, bg = C.mantle },
        -- TabLine = { fg = C.overlay0, bg = C.one_bg },

        -- MarkSignHL = { fg = C.base0D },
        -- MarkSignNumHL = { fg = C.base0D },
        -- For base configs.
        -- Function = { fg = cp.red }, --default: blue
        -- Comment = { fg = cp.overlay0 }, --default: overlay0 (or a slightly darker color than overlay 1)
        -- Search = { bg = cp.surface1, fg = cp.pink, style = { "bold" } },
        -- IncSearch = { bg = cp.pink, fg = cp.surface1 },
        -- Keyword = { fg = cp.red }, --default: pink
        -- Type = { fg = cp.blue }, --default
        -- Type = { fg = cp.yellow }, --rust: u8, String, etc...
        -- Typedef = { fg = cp.yellow },

        -- Splits
        VertSplit = { fg = C.surface0 }, --separator line

        -- For native lsp configs.
        -- DiagnosticVirtualTextError = { bg = cp.none },
        -- DiagnosticVirtualTextWarn = { bg = cp.none },
        -- DiagnosticVirtualTextInfo = { bg = cp.none },
        -- DiagnosticVirtualTextHint = { fg = cp.rosewater, bg = cp.none },

        -- DiagnosticHint = { fg = cp.rosewater },
        -- LspDiagnosticsDefaultHint = { fg = cp.rosewater },
        -- LspDiagnosticsHint = { fg = cp.rosewater },
        -- LspDiagnosticsVirtualTextHint = { fg = cp.rosewater },
        -- LspDiagnosticsUnderlineHint = { sp = cp.rosewater },

        -- For fidget.
        -- FidgetTask = { bg = cp.none, fg = cp.surface2 },
        -- FidgetTitle = { fg = cp.blue, style = { "bold" } },

        -- Alpha Colours
        -- AlphaHeader = { fg = cp.surface0 },
        -- AlphaFooter = { fg = cp.surface2 },
        -- AlphaSectionHeader = { fg = cp.surface2, bold = true },
        -- AlphaShortcut = { fg = cp.surface2 },

        -- --ToggleTerm Custom Colours
        -- LazygitBorder = { fg = cp.surface2 },
        --
        -- --Nvim-Notify Colours
        -- NotifyERRORBorder = { fg = cp.surface2, bg = cp.base },
        -- NotifyWARNBorder = { fg = cp.surface2, bg = cp.base },
        -- NotifyINFOBorder = { fg = cp.surface2, bg = cp.base },
        -- NotifyDEBUGBorder = { fg = cp.surface2, bg = cp.base },
        -- NotifyTRACEBorder = { fg = cp.surface2, bg = cp.base },
        --
        -- NotifyERRORIcon = { fg = cp.red, bg = cp.base },
        -- NotifyWARNIcon = { fg = cp.yellow, bg = cp.base },
        -- NotifyINFOIcon = { fg = cp.green, bg = cp.base },
        -- NotifyDEBUGIcon = { fg = cp.surface2, bg = cp.base },
        -- NotifyTRACEIcon = { fg = cp.lavender, bg = cp.base },
        --
        -- NotifyERRORTitle = { fg = cp.red, bg = cp.base },
        -- NotifyWARNTitle = { fg = cp.yellow, bg = cp.base },
        -- NotifyINFOTitle = { fg = cp.green, bg = cp.base },
        -- NotifyDEBUGTitle = { fg = cp.surface2, bg = cp.base },
        -- NotifyTRACETitle = { fg = cp.lavender, bg = cp.base },
        --
        -- NotifyERRORBody = { fg = cp.text, bg = cp.base },
        -- NotifyWARNBody = { fg = cp.text, bg = cp.base },
        -- NotifyINFOBody = { fg = cp.text, bg = cp.base },
        -- NotifyDEBUGBody = { fg = cp.text, bg = cp.base },
        -- NotifyTRACEBody = { fg = cp.text, bg = cp.base },

        -- ----------------------------------------------------------------
        -- --editor.lua
        -- Splits
        --editor.lua
        CursorLineNr = { fg = C.base0B },
        -- Search = { bg = C.surface1, fg = C.pink, style = { "bold" } },

        --nvchad defaults.lua
        -- MatchWord = { bg = C.grey, fg = C.white, },

        Pmenu = { bg = C.one_bg, fg = C.base05 },
        PmenuSbar = { bg = C.one_bg },
        PmenuSel = { bg = C.pmenu_bg, fg = C.base05 },
        PmenuThumb = { bg = C.base06 },

        MatchParen = { link = "MatchWord" },

        -- Comment = { fg = C.grey_fg, style = "italic", }, --do not uncomment, break

        -- CursorLineNr = { fg = C.white },
        LineNr = { fg = C.grey },

        -- floating windows
        FloatBorder = { fg = C.blue },
        NormalFloat = { bg = C.darker_black },

        NvimInternalError = { fg = C.red },
        WinSeparator = { fg = C.one_bg },

        -- packer
        PackerPackageName = { fg = C.red },
        PackerSuccess = { fg = C.green },
        PackerStatusSuccess = { fg = C.base08 },
        PackerStatusCommit = { fg = C.blue },
        PackeProgress = { fg = C.blue },
        PackerOutput = { fg = C.red },
        PackerStatus = { fg = C.blue },
        PackerHash = { fg = C.blue },

        -- Normal = { fg = C.base06, bg = C.base00, },

        Normal = { fg = C.base05, bg = O.transparent_background and C.none or C.base00 }, -- normal text
        Bold = { bold = true, },

        Debug = { fg = C.base08, },
        Directory = { fg = C.base0D, },
        Error = { fg = C.base00, bg = C.base08, },
        ErrorMsg = { fg = C.base08, bg = C.base00, },
        Exception = { fg = C.base08, },
        FoldColumn = { fg = C.base0C, bg = C.base01, },
        Folded = { fg = C.base05, bg = C.base01, },
        IncSearch = { fg = C.base01, bg = C.base09, },
        Italic = { italic = true, },
        Macro = { fg = C.base08, },
        ModeMsg = { fg = C.base0B, },
        MoreMsg = { fg = C.base0B, },
        Question = { fg = C.base0D, },
        Search = { fg = C.base01, bg = C.base0A, },
        Substitute = { fg = C.base01, bg = C.base0A, sp = "none", },
        SpecialKey = { fg = C.base03, },
        TooLong = { fg = C.base08, },
        UnderLined = { fg = C.base0B, },
        Visual = { bg = C.base02, },
        VisualNOS = { fg = C.base08, },
        WarningMsg = { fg = C.base08, },
        WildMenu = { fg = C.base08, bg = C.base0A, },
        Title = { fg = C.base0D, sp = "none", },
        Conceal = { bg = "NONE", },
        Cursor = { fg = C.base00, bg = C.base05, },
        NonText = { fg = C.base03, },
        SignColumn = { fg = C.base03, sp = "NONE", },
        ColorColumn = { bg = C.base01, sp = "none", },
        CursorColumn = { bg = C.base01, sp = "none", },
        CursorLine = { bg = "none", sp = "none", },
        QuickFixLine = { bg = C.base01, sp = "none", },
        -- spell
        SpellBad = { undercurl = true, sp = C.base08, },
        SpellLocal = { undercurl = true, sp = C.base0C, },
        SpellCap = { undercurl = true, sp = C.base0D, },
        SpellRare = { undercurl = true, sp = C.base0E, },

        healthSuccess = { bg = C.green, fg = C.black, },
        --syntax.lua--------------------------------------------
        --nvchad
        Boolean = { fg = C.base09, },
        Character = { fg = C.base08, },
        Conditional = { fg = C.base0E, },
        Constant = { fg = C.base08, },
        Define = { fg = C.base0E, sp = "none", },
        Delimiter = { fg = C.base0F, },
        Float = { fg = C.base09, },
        Variable = { fg = C.base05, },
        Function = { fg = C.base0D, style = { "bold" }, },
        Identifier = { fg = C.base08, sp = "none", },
        Include = { fg = C.base0D, },
        Keyword = { fg = C.base0E, },
        Label = { fg = C.base0A, },
        Number = { fg = C.base09, },
        Operator = { fg = C.base0E, sp = "none", }, --for == + % etc...
        PreProc = { fg = C.base0A, },
        Repeat = { fg = C.base0A, },
        Special = { fg = C.base0C, },
        SpecialChar = { fg = C.base0F, },
        Statement = { fg = C.base08, },
        StorageClass = { fg = C.base0A, },
        String = { fg = C.base0B, },
        Structure = { fg = C.base0E, },
        Tag = { fg = C.base0A, },
        Todo = { fg = C.base0A, bg = C.base01, },
        Type = { fg = C.base0A, sp = "none", },
        Typedef = { fg = C.base0A, },

        -- --cmp.lua--------------------------------------------
        -- --nvchad-----------------------
        -- -- nvim cmp
        -- CmpItemAbbr = { fg = C.white },
        -- -- CmpItemAbbrMatch = { fg = C.blue, bold = true },
        -- CmpItemAbbrMatch = { fg = C.blue, style = { "bold" } }, --adapted
        -- CmpBorder = { fg = C.grey },
        -- CmpDocBorder = { fg = C.darker_black, bg = C.darker_black },
        -- CmPmenu = { bg = C.darker_black },
        --
        -- -- cmp item kinds
        -- CmpItemKindConstant = { fg = C.base09 },
        -- CmpItemKindFunction = { fg = C.base0D },
        -- CmpItemKindIdentifier = { fg = C.base08 },
        -- CmpItemKindField = { fg = C.base08 },
        -- CmpItemKindVariable = { fg = C.base0E },
        -- CmpItemKindSnippet = { fg = C.red },
        -- CmpItemKindText = { fg = C.base0B },
        -- CmpItemKindStructure = { fg = C.base0E },
        -- CmpItemKindType = { fg = C.base0A },
        -- CmpItemKindKeyword = { fg = C.base07 },
        -- CmpItemKindMethod = { fg = C.base0D },
        -- CmpItemKindConstructor = { fg = C.blue },
        -- CmpItemKindFolder = { fg = C.base07 },
        -- CmpItemKindModule = { fg = C.base0A },
        -- CmpItemKindProperty = { fg = C.base08 },
        -- -- CmpItemKindEnum = { fg = "" },
        -- CmpItemKindUnit = { fg = C.base0E },
        -- -- CmpItemKindClass = { fg = "" },
        -- CmpItemKindFile = { fg = C.base07 },
        -- -- CmpItemKindInterface = { fg = "" },
        -- CmpItemKindColor = { fg = C.red },
        -- CmpItemKindReference = { fg = C.base05 },
        -- -- CmpItemKindEnumMember = { fg = "" },
        -- CmpItemKindStruct = { fg = C.base0E },
        -- -- CmpItemKindValue = { fg = "" },
        -- -- CmpItemKindEvent = { fg = "" },
        -- CmpItemKindOperator = { fg = C.base05 },
        -- CmpItemKindTypeParameter = { fg = C.base08 },
        -- CmpItemKindCopilot = { fg = C.green },

        --indent_blankline.lua -------------------------------------------
        IndentBlanklineChar = { fg = C.one_bg2 },
        IndentBlanklineSpaceChar = { fg = C.one_bg2 },
        -- IndentBlanklineContextChar = { fg = C.grey },
        IndentBlanklineContextChar = { fg = C.base0E },
        IndentBlanklineContextStart = { bg = C.one_bg},

        IndentBlanklineIndent1 = { blend = 0, fg = C.one_bg2},
        IndentBlanklineIndent2 = { blend = 0, fg = C.grey_fg2},

        -- native_lsp.lua
        -- LSP References (note: don't uncomment, default is better)
        -- LspReferenceText = { fg = C.darker_black, bg = C.white },
        -- LspReferenceRead = { fg = C.darker_black, bg = C.white },
        -- LspReferenceWrite = { fg = C.darker_black, bg = C.white },
        -- Lsp Diagnostics
        DiagnosticHint = { fg = C.purple },
        -- DiagnosticError = { fg = C.red },
        -- DiagnosticWarn = { fg = C.yellow },
        DiagnosticInformation = { fg = C.green },
        LspSignatureActiveParameter = { fg = C.black, bg = C.green },

        RenamerTitle = { fg = C.black, bg = C.red },
        RenamerBorder = { fg = C.red },

        --telescope.lua--------------------------------------------
        -- TelescopeBorder = {
        --   fg = C.darker_black,
        --   bg = C.darker_black,
        -- },
        -- TelescopePromptBorder = {
        --   fg = C.black2,
        --   bg = C.black2,
        -- },
        -- TelescopePromptNormal = {
        --   fg = C.white,
        --   -- bg = C.black2,
        -- },
        -- TelescopePromptPrefix = {
        --   fg = C.red,
        --   -- bg = C.black2,
        -- },
        TelescopeNormal = { bg = C.darker_black },
        TelescopePreviewTitle = {
          fg = C.green,
          -- bg = C.green,
        },
        TelescopePromptTitle = {
          fg = C.red,
          -- bg = C.red,
        },
        TelescopeResultsTitle = {
          fg = C.orange,
          -- bg = C.purple,
        },
        --
        -- --[[     TelescopeSelection = { bg = C.black2, fg = C.white, style = "bold" }, ]] --error
        --
        -- TelescopeResultsDiffAdd = {
        --   fg = C.green,
        -- },
        --
        -- TelescopeResultsDiffChange = {
        --   fg = C.yellow,
        -- },
        --
        -- TelescopeResultsDiffDelete = {
        --   fg = C.red,
        -- },

        --nvimtree.lua--------------------------------------------
        -- NvimTreeEmptyFolderName = { fg = C.folder_bg }, --blue
        -- NvimTreeEndOfBuffer = { fg = C.darker_black }, --?
        -- NvimTreeFolderIcon = { fg = C.folder_bg },
        -- NvimTreeFolderName = { fg = C.folder_bg },
        -- NvimTreeGitDirty = { fg = C.red }, --default: yellow
        NvimTreeIndentMarker = { fg = C.grey_fg },
        NvimTreeNormal = { bg = C.darker_black },
        NvimTreeNormalNC = { bg = C.darker_black },
        NvimTreeOpenedFolderName = { fg = C.folder_bg },
        NvimTreeGitIgnored = { fg = C.light_grey },

        NvimTreeWinSeparator = { fg = C.darker_black, bg = C.darker_black, },

        NvimTreeWindowPicker = { fg = C.red, bg = C.black2, },

        NvimTreeCursorLine = { bg = C.black2, },

        NvimTreeGitNew = { fg = C.yellow, },

        -- NvimTreeGitDeleted = { fg = C.red, },

        NvimTreeSpecialFile = { fg = C.yellow, bold = true, },

        NvimTreeRootFolder = { fg = C.red, bold = true, },

        -- HopNextKey = { fg = C.peach, style = { "bold", "underline" } },
        HopNextKey = { fg = C.peach, style = { "bold" } },
        HopNextKey1 = { fg = C.blue, style = { "bold" } },
        HopNextKey2 = { fg = C.teal, style = { "bold", "italic" } },
        HopUnmatched = { fg = C.overlay0 },

        --treesitter.lua--------------------------------------------
        -- `@annotation` is not one of the default capture group, should we keep it
        ["@annotation"] = { fg = C.base0F, },
        ["@attribute"] = { fg = C.base0A, },
        ["@character"] = { fg = C.base08, },
        ["@constructor"] = { fg = C.base0C, },

        ["@constant.builtin"] = { fg = C.base09, },
        ["@constant.macro"] = { fg = C.base08, },

        ["@error"] = { fg = C.base08, },
        ["@exception"] = { fg = C.base08, },
        ["@float"] = { fg = C.base09, },

        ["@keyword"] = { fg = C.base0E, },
        ["@keyword.function"] = { fg = C.base0E, },
        ["@keyword.return"] = { fg = C.base0E, },

        ["@function"] = { fg = C.base0D, },
        ["@function.builtin"] = { fg = C.base0D, },
        ["@function.macro"] = { fg = C.base08, },

        ["@keyword.operator"] = { fg = C.base0E, },
        ["@method"] = { fg = C.base0D, },
        ["@namespace"] = { fg = C.base08, },
        ["@none"] = { fg = C.base05, },
        ["@parameter"] = { fg = C.base08, },
        ["@reference"] = { fg = C.base05, },

        ["@punctuation.bracket"] = { fg = C.base0F, },
        ["@punctuation.delimiter"] = { fg = C.base0F, },
        ["@punctuation.special"] = { fg = C.base08, },

        ["@string.regex"] = { fg = C.base0C, },
        ["@string.escape"] = { fg = C.base0C, },

        ["@symbol"] = { fg = C.base0B },

        ["@tag"] = { link = "Tag", },

        ["@tag.attribute"] = { link = "@property", },
        ["@tag.delimiter"] = { fg = C.base0F, },

        ["@text"] = { fg = C.base05, },
        ["@text.strong"] = { bold = true, },
        ["@text.emphasis"] = { fg = C.base09, },
        ["@text.strike"] = { fg = C.base00, strikethrough = true, },
        ["@text.literal"] = { fg = C.base09, },
        ["@text.uri"] = { fg = C.base09, underline = true, },

        ["@type.builtin"] = { fg = C.base0A, },

        ["@variable"] = { fg = C.base05, },
        ["@variable.builtin"] = { fg = C.base0C, },

        -- variable.global
        ["@definition"] = { sp = C.base04, underline = true, },
        TSDefinitionUsage = { sp = C.base04, underline = true, },
        ["@scope"] = { bold = true, },
        ["@field"] = { fg = C.base08, },
        --
        -- ["@field.key"] = {
        --   fg = C.base0D,
        -- },

        ["@property"] = { fg = C.base08, },
        ["@include"] = { link = "Include", },
        ["@conditional"] = { link = "Conditional", },

        --ayamir-------------------------------------
        -- -- For treesitter.
        -- -- ["@field"] = { fg = C.rosewater }, --commented from this to 336
        -- -- ["@property"] = { fg = C.yellow },
        -- --
        -- -- ["@include"] = { fg = C.teal },
        -- -- -- ["@operator"] = { fg = C.sky },
        -- -- ["@keyword.operator"] = { fg = C.sky },
        -- -- ["@punctuation.special"] = { fg = C.maroon },
        -- --
        -- -- -- ["@float"] = { fg = C.peach },
        -- -- -- ["@number"] = { fg = C.peach },
        -- -- -- ["@boolean"] = { fg = C.peach },
        -- --
        -- -- ["@constructor"] = { fg = C.lavender },
        -- -- -- ["@constant"] = { fg = C.peach },
        -- -- -- ["@conditional"] = { fg = C.mauve },
        -- -- -- ["@repeat"] = { fg = C.mauve },
        -- -- ["@exception"] = { fg = C.peach },
        -- --
        -- -- ["@constant.builtin"] = { fg = C.lavender },
        -- -- -- ["@function.builtin"] = { fg = C.peach, style = { "italic" } },
        -- -- -- ["@type.builtin"] = { fg = C.yellow, style = { "italic" } },
        -- -- ["@variable.builtin"] = { fg = C.red, style = { "italic" } },
        -- --
        -- -- -- ["@function"] = { fg = C.blue },
        -- -- ["@function.macro"] = { fg = C.red, style = {} },
        -- -- ["@parameter"] = { fg = C.rosewater },
        -- -- ["@keyword"] = { fg = C.red, style = { "italic" } },
        -- -- ["@keyword.function"] = { fg = C.maroon },
        -- -- ["@keyword.return"] = { fg = C.red, style = {} }, --default: pink
        -- --
        -- -- -- ["@text.note"] = { fg = C.base, bg = C.blue },
        -- -- -- ["@text.warning"] = { fg = C.base, bg = C.yellow },
        -- -- -- ["@text.danger"] = { fg = C.base, bg = C.red },
        -- -- -- ["@constant.macro"] = { fg = C.mauve },
        -- --
        -- -- -- ["@label"] = { fg = C.blue },
        -- -- ["@method"] = { style = { "italic" } },
        -- -- ["@namespace"] = { fg = C.rosewater, style = {} },
        -- --
        -- -- ["@punctuation.delimiter"] = { fg = C.teal },
        -- -- ["@punctuation.bracket"] = { fg = C.overlay2 },
        -- -- -- ["@string"] = { fg = C.green },
        -- -- -- ["@string.regex"] = { fg = C.peach },
        -- -- ["@type"] = { fg = C.yellow },
        -- -- ["@variable"] = { fg = C.text },
        -- -- ["@tag.attribute"] = { fg = C.mauve, style = { "italic" } },
        -- -- ["@tag"] = { fg = C.peach },
        -- -- ["@tag.delimiter"] = { fg = C.maroon },
        -- -- ["@text"] = { fg = C.text },
        -- --
        -- -- -- ["@text.uri"] = { fg = C.rosewater, style = { "italic", "underline" } },
        -- -- -- ["@text.literal"] = { fg = C.teal, style = { "italic" } },
        -- -- -- ["@text.reference"] = { fg = C.lavender, style = { "bold" } },
        -- -- -- ["@text.title"] = { fg = C.blue, style = { "bold" } },
        -- -- -- ["@text.emphasis"] = { fg = C.maroon, style = { "italic" } },
        -- -- -- ["@text.strong"] = { fg = C.maroon, style = { "bold" } },
        -- -- -- ["@string.escape"] = { fg = C.pink },
        -- --
        -- -- -- ["@property.toml"] = { fg = C.blue },
        -- -- -- ["@field.yaml"] = { fg = C.blue },
        -- --
        -- -- -- ["@label.json"] = { fg = C.blue },
        --
        -- ["@function.builtin.bash"] = { fg = C.red, style = { "italic" } },
        -- ["@parameter.bash"] = { fg = C.yellow, style = { "italic" } },
        --
        -- ["@field.lua"] = { fg = C.blue }, --default: lavender
        --
        -- ["@constant.java"] = { fg = C.teal },
        --
        -- ["@property.typescript"] = { fg = C.lavender, style = { "italic" } },
        -- -- ["@constructor.typescript"] = { fg = C.lavender },
        --
        -- -- ["@constructor.tsx"] = { fg = C.lavender },
        -- -- ["@tag.attribute.tsx"] = { fg = C.mauve },
        --
        -- ["@property.css"] = { fg = C.yellow, style = { "italic" } },
        --
        -- ["@property.ccp"] = { fg = C.text },
        --
        -- -- ["@symbol"] = { fg = C.flamingo },
      }
    end
  },

})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
