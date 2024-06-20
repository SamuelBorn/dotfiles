return {
    "jbyuki/nabla.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
        require("nabla").enable_virt()
    end
}
