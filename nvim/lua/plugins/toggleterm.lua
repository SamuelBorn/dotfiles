return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup({ direction = "float" })

        Lazygit = require("toggleterm.terminal").Terminal:new({ cmd = "lazygit", hidden = true })
        vim.keymap.set({ "n", "t" }, "<leader>g", "<cmd>lua Lazygit:toggle()<CR>")
        vim.keymap.set({ "n", "t" }, "<leader>t", "<cmd>ToggleTerm<CR>")
    end
}
