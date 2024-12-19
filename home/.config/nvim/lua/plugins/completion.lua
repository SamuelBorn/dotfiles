---@diagnostic disable: missing-fields
return {
    'saghen/blink.cmp',
    version = '*',
    dependencies = {
        { 'rafamadriz/friendly-snippets' },
        { 'L3MON4D3/LuaSnip',            version = '*' },
    },
    config = function()
        local ls = require("luasnip")
        ls.config.setup({ enable_autosnippets = true })
        require('luasnip.loaders.from_lua').lazy_load({ paths = { "./lua/snippets" } })

        require("blink.cmp").setup({
            snippets = {
                expand = function(snippet) ls.lsp_expand(snippet) end,
                active = function(filter)
                    if filter and filter.direction then
                        return ls.jumpable(filter.direction)
                    end
                    return ls.in_snippet()
                end,
                jump = function(direction) ls.jump(direction) end,
            },
            sources = {
                default = { 'luasnip', 'lsp', 'path', 'snippets' },
                cmd = {}
            },
        })
    end,
}
