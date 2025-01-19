return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("catppuccin-mocha")
        end
    },
    -- {
    --     'projekt0n/github-nvim-theme',
    --     priority = 1000,
    --
    -- },
    -- {
    --     "folke/tokyonight.nvim",
    --     priority = 1000,
    -- },
    -- {
    --     "sainnhe/gruvbox-material",
    --     priority = 1000,
    --     config = function()
    --         vim.g.gruvbox_material_palette = "mix"
    --     end
    -- },
    -- {
    --     "rebelot/kanagawa.nvim",
    --     priority = 1000,
    -- },
}
