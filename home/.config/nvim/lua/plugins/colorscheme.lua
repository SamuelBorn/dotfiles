return {
    -- "folke/tokyonight.nvim",
    -- "ellisonleao/gruvbox.nvim",
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        vim.cmd.colorscheme("catppuccin")
        -- vim.cmd.colorscheme("tokyonight-night")
        -- vim.cmd.colorscheme("gruvbox")
    end,
}
