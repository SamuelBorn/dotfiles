---@diagnostic disable: missing-fields
return {
    "saghen/blink.cmp",
    version = "*",
    dependencies = {
        { "rafamadriz/friendly-snippets" },
        { "L3MON4D3/LuaSnip",            version = "*" },
    },
    config = function()
        require("luasnip").config.setup({ enable_autosnippets = true })
        require("luasnip.loaders.from_lua").lazy_load({ paths = { "./lua/snippets" } })

        require("blink.cmp").setup({
            sources = { default = { "luasnip", "lsp", "path", "snippets", "lazydev" } }
        })
    end,
}
