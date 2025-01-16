return {
    "akinsho/toggleterm.nvim",
    config = function()
        require("toggleterm").setup({
            direction = "vertical",
            size = function() return vim.o.columns * 0.381966 end,
            persist_size = false,
            persist_mode = false,
        })

        Lazygit = require("toggleterm.terminal").Terminal:new({
            cmd = "lazygit",
            hidden = true,
            direction = "float",
            on_open = function(term)
                -- reset Esc key to leave terminal mode so it is usable in lazygit
                vim.keymap.set("t", "<Esc>", "<Esc>", { buffer = term.bufnr })
            end,
        })
    end,
    keys = {
        { "<C-\\>", "<cmd>ToggleTerm<CR>",           mode = { "n", "t", "i" } },
        { "<C-g>",  "<cmd>lua Lazygit:toggle()<CR>", mode = { "n", "t", "i" } },
    },
}
