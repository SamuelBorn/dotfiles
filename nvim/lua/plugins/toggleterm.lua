return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup({ direction = "vertical", size = vim.o.columns * 0.4, shade_terminals = false })

        Lazygit = require("toggleterm.terminal").Terminal:new({ cmd = "lazygit", hidden = true })
        vim.keymap.set({ "n", "t" }, "<A-g>", "<cmd>lua Lazygit:toggle()<CR>")
        vim.keymap.set({ "n", "t" }, "<A-t>", "<cmd>ToggleTerm<CR>")
    end
}
