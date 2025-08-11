return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup {
            color_overrides = {
                mocha = {
                    base = "#1c1b22",
                    crust = "#1c1b22",
                    mantle = "#131317",
                },
            }
        }
        vim.cmd.colorscheme("catppuccin-mocha")
    end,
}
