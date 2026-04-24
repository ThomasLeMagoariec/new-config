return {
  require("luasnip").snippet("fn", {
    require("luasnip").text_node("function "),
    require("luasnip").insert_node(1, "name"),
    require("luasnip").text_node("()"),
    require("luasnip").text_node({"", "  "}),
    require("luasnip").insert_node(2),
    require("luasnip").text_node({"", "end"}),
  }),
}
