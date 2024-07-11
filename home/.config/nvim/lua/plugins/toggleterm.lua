return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup({ direction = "vertical", size = vim.o.columns * 0.4 })

        Lazygit = require("toggleterm.terminal").Terminal:new({
            cmd = "lazygit",
            hidden = true,
            direction = "float",
            on_open = function(term)
                -- reset Esc key to leave terminal mode so it is usable in lazygit
                vim.keymap.set("t", "<Esc>", "<Esc>", { buffer = term.bufnr })
            end,
        })

        vim.keymap.set({ "n", "t" }, "<C-g>", "<cmd>lua Lazygit:toggle()<CR>")
        vim.keymap.set({ "n", "t" }, "<C-\\>", "<cmd>ToggleTerm<CR>")
    end
}
