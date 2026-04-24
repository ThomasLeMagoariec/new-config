return {
  s("guard", {
    t("#ifndef "),
    i(1, "HEADER_H"),
    t({"", "#define "}),
    rep(1),
    t({"", "", ""}),
    i(2, "// declarations"),
    t({"", "", "#endif // "}),
    rep(1),
  }),
}
