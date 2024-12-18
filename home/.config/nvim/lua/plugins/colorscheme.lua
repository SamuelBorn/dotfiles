return {
    "sainnhe/gruvbox-material",
    priority = 1000,
    config = function()
        vim.g.gruvbox_material_palette = "mix"
        vim.cmd.colorscheme("gruvbox-material")
    end
}
