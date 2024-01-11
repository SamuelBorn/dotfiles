return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'rafamadriz/friendly-snippets',
    },
    config = function()
        require('luasnip.loaders.from_vscode').lazy_load() -- friendly snippets setup

        require('luasnip').config.setup {}

        require('cmp').setup {
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            mapping = require('cmp').mapping.preset.insert {
                ['<C-n>'] = require('cmp').mapping.select_next_item(),
                ['<C-p>'] = require('cmp').mapping.select_prev_item(),
                ['<CR>'] = require('cmp').mapping.confirm {
                    behavior = require('cmp').ConfirmBehavior.Replace,
                    select = true,
                },
                ['<C-e>'] = require("cmp").mapping.abort(),
            },
            sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'path' },
                { name = 'buffer' },
            },
        }
    end
}
