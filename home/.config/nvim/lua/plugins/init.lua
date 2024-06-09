-- one-line plugin imports
return {
    { 'echasnovski/mini.surround',  opts = {} },
    { 'nvim-tree/nvim-web-devicons' },
    {
        'github/copilot.vim',
        config = function()
            vim.keymap.set('i', '<c-space>', 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })
            vim.g.copilot_no_tab_map = true
        end
    },
}
