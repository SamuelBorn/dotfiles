-- one-line plugin imports
return {
    { 'numToStr/Comment.nvim',  opts = {} },
    { "kylechui/nvim-surround", opts = {} },
    {
        'github/copilot.vim',
        config = function()
            vim.keymap.set('i', '<c-space>', 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })
            vim.g.copilot_no_tab_map = true
        end
    },
}
