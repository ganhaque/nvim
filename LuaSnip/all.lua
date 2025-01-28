local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

-- Place this in ${HOME}/.config/nvim/LuaSnip/all.lua
return {
  -- -- A snippet that expands the trigger "hi" into the string "Hello, world!".
  -- require("luasnip").snippet(
  --   { trig = "hi" },
  --   { t("Hello, world!") }
  -- ),
  --
  -- -- To return multiple snippets, use one `return` statement per snippet file
  -- -- and return a table of Lua snippets.
  -- require("luasnip").snippet(
  --   { trig = "foo" },
  --   { t("Another snippet.") }
  -- ),

  s({trig = "calendar", dscr = ""}, {
    -- t(
    --   lines
    -- ),
    t((
      function()
        local result = {}
        for line in require("calendar").getCalendar():gmatch("[^\n]+")
          do table.insert(result, line)
        end
        return result
      end
    )())
  }),
}
