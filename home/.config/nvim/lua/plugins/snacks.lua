return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        picker = { enabled = true },
        notifier = { enabled = true },
        terminal = {
            win = {
                wo = { winbar = '' },
                keys = { term_normal = {} },
            },
        },
    },
    keys = {
        { "<leader><leader>", function() Snacks.picker.smart() end },
        { "<leader>fc",       function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end },
        { "<leader>fh",       function() Snacks.picker.help() end },
        { "<leader>fg",       function() Snacks.picker.grep() end },
        { "<leader>ff",       function() Snacks.picker.files() end },
        { "<leader>bo",       function() Snacks.bufdelete.other() end },
        { "<leader>bd",       function() Snacks.bufdelete() end },
        { "<C-\\>",           function() Snacks.terminal() end,                                      mode = { "n", "t", "i" } },
        { "<C-g>",            function() Snacks.lazygit() end,                                       mode = { "n", "t", "i" } },
    },
}
