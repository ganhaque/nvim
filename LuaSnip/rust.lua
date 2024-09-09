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

return {
  -- -- Shorthand
  -- s("hi",  -- LuaSnip expands this to {trig = "hi"}
  --   { t("Hello, world!"), }
  -- ),
  -- -- -- Here is the equivalent longhand
  -- -- s({trig = "hi"}  -- explicitly setting trigger via params table
  -- --   { t("Hello, world!"), }
  -- -- ),
  -- s({trig = "lines", dscr = "Demo: a text node with three lines."},
  --   {
  --     t({"Line 1", "Line 2", "Line 3"})
  --   }
  -- ),


  -- -- Example: how to set snippet parameters
  -- require("luasnip").snippet(
  --   { -- Table 1: snippet parameters
  --     trig="hi",
  --     dscr="An autotriggering snippet that expands 'hi' into 'Hello, world!'",
  --     regTrig=false,
  --     priority=100,
  --     snippetType="autosnippet"
  --   },
  --   { -- Table 2: snippet nodes (don't worry about this for now---we'll cover nodes shortly)
  --     t("Hello, world!"), -- A single text node
  --   }
  --   -- Table 3, the advanced snippet options, is left blank.
  -- ),



  s({trig = "query", dscr = "Long Query"},
    {
      t({
        "Query<(",
        "  ",
      }),
      i(1),
      t({
        "",
        "), (",
        "  ",
      }),
      i(2),
      t({
        "",
        ")>,",
      }),
    }
  ),
  s({trig = "letokquery_get", dscr = "Bevy let ok"}, {
    t({
      "let Ok((",
      "  ",
    }),
    i(1),
    t({
      "",
      ")) = ",
    }),
    i(2, "query"),
    t({
      "_query.get(",
    }),
    i(3, "entity"),
    t({
      "_entity) else {return};",
      "",
    }),
  }),
  s({trig = "component_struct", dscr = "shorthand for bevy component"}, {
    t({
      "#[derive(Component, Clone)]",
      "pub struct ",
    }),
    i(1),
  }),
  s({trig = "event_struct", dscr = "shorthand for bevy event"}, {
    t({
      "#[derive(Event, Clone)]",
      "pub struct ",
    }),
    i(1),
  }),
}
