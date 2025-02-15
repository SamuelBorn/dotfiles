return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        picker = { enabled = true },
        notifier = { enabled = true },
        terminal = { win = { wo = { winbar = '' } } },
    },
    keys = {
        { "<leader><leader>", function() Snacks.picker.smart() end },
        { "<leader>fc",       function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end },
        { "<leader>fh",       function() Snacks.picker.help() end },
        { "<leader>fg",       function() Snacks.picker.grep() end },
        { "<leader>ff",       function() Snacks.picker.files() end },
        { "<leader>fr",       function() Snacks.picker.resume() end },
        { "<leader>bo",       function() Snacks.bufdelete.other() end },
        { "<leader>bd",       function() Snacks.bufdelete() end },
        { "<C-\\>",           function() Snacks.terminal() end, mode = { "n", "t" } },
        { "<C-g>",            function() Snacks.lazygit() end, mode = { "n", "t" } },
    },
}
