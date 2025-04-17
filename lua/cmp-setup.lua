-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

-- local check_backspace = function()
--   local col = vim.fn.col "." - 1
--   return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
-- end

-- cmp.event:on(
--   'confirm_done',
--   require('nvim-autopairs.completion.cmp').on_confirm_done()
-- )

cmp.setup {
  window = {
    documentation = cmp.config.window.bordered()
  },
  formatting = {
    format = require("lspkind").cmp_format({
      mode = "symbol_text",
      menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[Latex]",
      })
    }),
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  -- completion = {
  --   completeopt = 'menu,menuone,noinsert'
  -- },
  preselect = 'None',
  mapping = cmp.mapping.preset.insert {
    -- ['<C-n>'] = cmp.mapping.select_next_item(),
    -- ['<C-p>'] = cmp.mapping.select_prev_item(),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    -- ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
    -- ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    -- ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    -- ['<C-Space>'] = cmp.mapping.complete {},
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),

    -- Jump to next/prev placeholder in snippet
    ['<C-f>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, {'i', 's'}),
    ['<C-b>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {'i', 's'}),

    -- ['<CR>'] = cmp.mapping.confirm {
    --   behavior = cmp.ConfirmBehavior.Replace,
    --   select = true,
    -- },
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm { select = false },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand()
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
        -- elseif check_backspace() then
        --   fallback()
      else
        fallback()
      end
    end, { "i", "s", }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s", }),
    -- ['<Tab>'] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_next_item()
    --   elseif luasnip.expand_or_locally_jumpable() then
    --     luasnip.expand_or_jump()
    --   else
    --     fallback()
    --   end
    -- end, { 'i', 's' }),
    -- ['<S-Tab>'] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_prev_item()
    --   elseif luasnip.locally_jumpable(-1) then
    --     luasnip.jump(-1)
    --   else
    --     fallback()
    --   end
    -- end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    -- { name = 'nvim_lsp_signature_help' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'emoji' },
    { name = 'vsnip' },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
}

---

local types = require("luasnip.util.types")
luasnip.config.set_config({
  -- history = true,                            --keep around last snippet local to jump back
  -- updateevents = "TextChanged,TextChangedI", --update changes as you type
  -- enable_autosnippets = true,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        -- virt_text = { { "●", "LuaSnipChoice" } },
        virt_text = { { "  hmmm, choices", "Comment" } },
      },
    },
    [types.insertNode] = {
      active = {
        virt_text = {{ "  snip snip snip", "Comment" }},
      },
    },
  },
  -- region_check_events = "CursorMoved",
  -- delete_check_events = "TextChanged,InsertLeave",
})

-- HACK: Cancel the snippet session when leaving insert mode.
local unlink_group = vim.api.nvim_create_augroup('UnlinkSnippet', { })
vim.api.nvim_create_autocmd('ModeChanged', {
   group = unlink_group,
   -- when going from select mode to normal and when leaving insert mode
   pattern = { 's:n', 'i:*' },
   callback = function(event)
     if
       luasnip.session
       and luasnip.session.current_nodes[event.buf]
       and not luasnip.session.jump_active
     then
       luasnip.unlink_current()
     end
   end,
})
