return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                -- transparent_background = true,
            })
            -- vim.cmd.colorscheme("catppuccin")
        end
    },
    {
        "folke/tokyonight.nvim",
        priority = 1000,
        config = function()
            -- vim.cmd.colorscheme("tokyonight-night")
        end
    },
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("gruvbox")
        end
    },
    {
        "projekt0n/github-nvim-theme",
        priority = 1000,
        config = function()
            require("github-theme").setup({
                options = {
                    -- transparent = true,
                },
            })
            -- vim.cmd.colorscheme("github_dark_default")
        end
    },
}
