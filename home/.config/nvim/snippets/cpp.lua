return {}, {
    s("cout", {t("std::cout << "), i(1), t(" << std::endl;")}),
    postfix(".for", {
        t("for (auto "),
        i(1, "e"),
        l(" : " .. l.POSTFIX_MATCH .. ") {"),
        t({"", "\t"}),
        i(0),
        t({"", "}"}),
    }),
    postfix(".print", {
        l("for (auto e : " .. l.POSTFIX_MATCH .. ") {"),
        t({"", "\t"}),
        t({"std::cout << e << std::endl;", "}"}),
        i(0),
    }),
}
