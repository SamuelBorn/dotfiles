return {
    "saghen/blink.cmp",
    version = "*",
    dependencies = {
        { "rafamadriz/friendly-snippets" },
        { "L3MON4D3/LuaSnip",            version = "*" },
    },
    config = function()
        require("luasnip").config.setup({ enable_autosnippets = true })
        require("luasnip.loaders.from_lua").lazy_load({ paths = { "./snippets" } })
        require("blink.cmp").setup({ sources = { cmdline = {} } })
    end,
}
