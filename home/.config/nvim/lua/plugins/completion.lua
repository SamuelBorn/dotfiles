return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        "rafamadriz/friendly-snippets",
    },
    event = "VeryLazy",
    config = function()
        local cmp = require("cmp")
        local ls = require("luasnip")

        ls.config.setup({ enable_autosnippets = true })
        require("luasnip.loaders.from_lua").lazy_load({ paths = { "./lua/snippets" } })
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup {
            snippet = {
                expand = function(args) ls.lsp_expand(args.body) end,
            },
            mapping = cmp.mapping.preset.insert {
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<C-y>"] = cmp.mapping.confirm { select = true },
                ["<C-l>"] = cmp.mapping(function() if ls.expand_or_locally_jumpable() then ls.expand_or_jump() end end, { 'i', 's' }),
                ["<C-h>"] = cmp.mapping(function() if ls.locally_jumpable(-1) then ls.jump(-1) end end, { 'i', 's' }), },
            sources = {
                { name = "luasnip" },
                { name = "nvim_lsp" },
                { name = "path" },
                { name = "buffer" },
            },
        }
    end
}
