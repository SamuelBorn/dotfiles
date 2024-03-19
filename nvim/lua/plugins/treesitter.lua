return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    version = "*",
    config = function()
        require("nvim-treesitter.configs").setup {
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = { 'bash', 'c', 'cpp', 'rust', 'html', 'lua', 'markdown', 'vim', 'vimdoc', 'yaml' },
            auto_install = true,
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    node_decremental = "<bs>",
                },
            },
        }
    end
}
