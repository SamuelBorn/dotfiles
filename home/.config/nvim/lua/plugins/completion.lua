return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        {
            "rafamadriz/friendly-snippets",
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
            end
        },
    },
    event = "VeryLazy",
    config = function()
        local ls = require("luasnip")
        require("luasnip").config.setup()
        ls.add_snippets("cpp", {
            ls.snippet("cout", {
                ls.text_node("std::cout << "),
                ls.insert_node(1),
                ls.text_node(" << std::endl;"),
            }),
        }, { override_priority = 1001 })

        local cmp = require("cmp")
        cmp.setup {
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert {
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<C-y>"] = cmp.mapping.confirm { select = true },
                ['<C-l>'] = cmp.mapping(function()
                    if require("luasnip").expand_or_locally_jumpable() then
                        require("luasnip").expand_or_jump()
                    end
                end, { 'i', 's' }),
                ['<C-h>'] = cmp.mapping(function()
                    if require("luasnip").locally_jumpable(-1) then
                        require("luasnip").jump(-1)
                    end
                end, { 'i', 's' }), },
            sources = {
                { name = "luasnip" },
                { name = "nvim_lsp" },
                { name = "path" },
                { name = "buffer" },
            },
        }
    end
}
