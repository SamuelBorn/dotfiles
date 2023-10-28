return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        require("nvim-treesitter.configs").setup {
            highlight = { enable = true },
            indent = { enable = true },
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
