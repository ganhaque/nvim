local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end
--------------------------------------------------------------------------
local colors = {
  --nvchad tokyonight
  base00 = "#1A1B26",
  base01 = "#3b4261",
  base02 = "#3b4261",
  base03 = "#545c7e",
  base04 = "#565c64",
  base05 = "#a9b1d6",
  base06 = "#bbc5f0",
  base07 = "#c0caf5",
  base08 = "#f7768e",
  base09 = "#ff9e64",
  base0A = "#ffd089",
  -- base0B = "#9ece6a",
  -- base0B = "#37d99e", --taken from radium
  -- base0D = "#38a3a5",
  base0C = "#2ac3de",
  -- base0D = "#7aa2f7",
  base0E = "#bb9af7",
  base0F = "#c0caf5",

  white = "#c0caf5",
  darker_black = "#16161e",
  -- black = "#1a1b26", --  nvim bg
  black = "#101317", --  nvim bg
  black2 = "#1f2336",
  one_bg = "#24283b",
  -- one_bg2 = "#414868",
  one_bg2 = "#2f303b",
  one_bg3 = "#353b45",
  grey = "#40486a",
  grey_fg = "#565f89",
  grey_fg2 = "#4f5779",
  light_grey = "#545c7e",
  red = "#f7768e",
  baby_pink = "#DE8C92",
  pink = "#ff75a0",
  line = "#32333e", -- for lines like vertsplit
  -- green = "#9ece6a",
  green = "#BAE881",
  vibrant_green = "#73daca",
  nord_blue = "#80a8fd",
  -- blue = "#7aa2f7",
  blue = "#38a3a5",
  -- yellow = "#e0af68",
  yellow = "#ffcb6b",
  sun = "#EBCB8B",
  purple = "#bb9af7",
  dark_purple = "#9d7cd8",
  teal = "#1abc9c",
  orange = "#ff9e64",
  cyan = "#7dcfff",
  statusline_bg = "#1d1e29",
  lightbg = "#32333e",
  pmenu_bg = "#7aa2f7",
  folder_bg = "#7aa2f7",

}

local theme = {
  normal = {
    a = {bg = colors.blue, fg = colors.black, gui = 'bold'},
    b = {bg = colors.base01, fg = colors.blue},
    c = {bg = colors.black, fg = colors.white}
  },
  insert = {
    a = {bg = colors.green, fg = colors.black, gui = 'bold'},
    b = {bg = colors.base01, fg = colors.green},
    c = {bg = colors.black, fg = colors.white}
  },
  visual = {
    a = {bg = colors.purple, fg = colors.black, gui = 'bold'},
    b = {bg = colors.base01, fg = colors.purple},
    c = {bg = colors.black, fg = colors.white}
  },
  terminal = {
    a = {bg = colors.green, fg = colors.black, gui = 'bold'},
    b = {bg = colors.base01, fg = colors.green},
    c = {bg = colors.black, fg = colors.white}
  },
  replace = {
    a = {bg = colors.red, fg = colors.black, gui = 'bold'},
    b = {bg = colors.base01, fg = colors.red},
    c = {bg = colors.black, fg = colors.white}
  },
  command = {
    a = {bg = colors.orange, fg = colors.black, gui = 'bold'},
    b = {bg = colors.base01, fg = colors.orange},
    c = {bg = colors.black, fg = colors.white}
  },
  inactive = {
    a = {bg = colors.darkgray, fg = colors.gray, gui = 'bold'},
    b = {bg = colors.darkgray, fg = colors.gray},
    c = {bg = colors.black, fg = colors.white}
  }
}

-- Put proper separators and gaps between components in sections

local empty = require('lualine.component'):extend()

-- local navic = require("nvim-navic")

-- white slash separator between modules
-- function empty:draw(default_highlight)
--   self.status = ''
--   self.applied_separator = ''
--   self:apply_highlights(default_highlight)
--   self:apply_section_separators()
--   return self.status
-- end

local function process_sections(sections)
  for name, section in pairs(sections) do
    local left = name:sub(9, 10) < 'x'
    for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
      table.insert(section, pos * 2, { empty, color = { fg = colors.white, bg = colors.white } })
    end
    for id, comp in ipairs(section) do
      if type(comp) ~= 'table' then
        comp = { comp }
        section[id] = comp
      end
      -- comp.separator = left and { right = '' } or { left = '' }
      comp.separator = left and { right = '' } or { left = '' }
      -- comp.separator = left and { right = '' } or { left = '' }
    end
  end
  return sections
end

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = " ", warn = " " },
  colored = true,
  diagnostics_color = {
    error = { fg = colors.red },
    warn = { fg = colors.yellow },
  },
  update_in_insert = false,
  always_visible = false,
}

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

local diff = {
  "diff",
  source = diff_source,
  colored = true,
  symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.yellow },
    removed = { fg = colors.red },
  },
  -- cond = hide_in_width
  cond = nil,
}

-- local mode = {
-- 	"mode",
-- 	fmt = function(str)
-- 		return "-- " .. str .. " --"
-- 	end,
-- }

local filetype = {
  "filetype",
  icons_enabled = true,
  icon = nil,
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = "",
}

local location = {
  "location",
  padding = 0,
}

-- cool function for progress
local progress = function()
  local current_line = vim.fn.line(".")
  local total_lines = vim.fn.line("$")
  local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return chars[index]
end

local spaces = function()
  return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = theme,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
    always_divide_middle = true,
  },
  sections = process_sections {
    lualine_a = { 'mode'},
    -- lualine_b = { branch },
    lualine_b = {
      -- diagnostics,
      -- diff,
      {
        'filename',
        symbols = {
          -- modified = '[+]',
          modified = ' ●',
          readonly = 'readonly',
          unnamed = '[No Name]',
          newfile = '[New]',
        },
        file_status = true,
        path = 0,
        shorting_target = 36
      },
    },
    lualine_c = {
      diagnostics,
      -- diff,
    },
    -- lualine_c = { diagnostics },
    -- lualine_x = { "encoding", "fileformat", "filetype" },
    -- lualine_x = { diff, spaces, "encoding", filetype, {
    -- lualine_x = { diff, filetype, {
    --   function()
    --     local msg = 'No Active Lsp'
    --     local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    --     local clients = vim.lsp.get_active_clients()
    --     if next(clients) == nil then
    --       return msg
    --     end
    --     for _, client in ipairs(clients) do
    --       local filetypes = client.config.filetypes
    --       if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
    --         return client.name
    --       end
    --     end
    --     return msg
    --   end,
    --   icon = ' LSP:',
    --   color = { fg = '#ffffff', gui = 'bold' },
    -- }
    -- },
    -- lualine_x = { diff, filetype, { navic.get_location, cond = navic.is_available },
    -- lualine_x = { diff, filetype },
    -- lualine_x = { 'buffers' },
    -- lualine_y = { location },
    -- lualine_z = { 'progress', progress },
    -- lualine_z = { 'progress', },

    lualine_x = {
      diff,
    },
    lualine_y = {},
    lualine_z = {},

    --some more valid options
    --'filesize'
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    -- lualine_c = { "filename" },
    lualine_c = {{'filename', file_status = true, path = 2}}, --what does file_status do?
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
})

