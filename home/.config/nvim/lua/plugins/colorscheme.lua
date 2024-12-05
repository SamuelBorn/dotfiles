return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            -- vim.cmd.colorscheme("gruvbox")
        end
    },
    -- {
    --     "folke/tokyonight.nvim",
    --     priority = 1000,
    --     config = function()
    --         vim.cmd.colorscheme("tokyonight-night")
    --     end
    -- },
    {
        "sainnhe/gruvbox-material",
        priority = 1000,
        config = function()
            vim.g.gruvbox_material_palette = "mix"
            vim.cmd.colorscheme("gruvbox-material")
        end
    }
}
