return {
  require("luasnip").snippet("guard", {
    require("luasnip").text_node("#ifndef "),
    require("luasnip").insert_node(1, "HEADER_H"),
    require("luasnip").text_node({"", "#define" }),
    require("luasnip.extras").rep(1),
    require("luasnip").text_node({"", "", ""}),
    require("luasnip").insert_node(2, "// stuff"),
    require("luasnip").text_node({"", "", "#endif /* "}),
    require("luasnip.extras").rep(1),
    require("luasnip").text_node("*/"),
  }),
}
