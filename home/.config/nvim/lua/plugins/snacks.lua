return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        picker = { enabled = true },
    },
    keys = {
        { "<leader><leader>", function() Snacks.picker.smart() end },
        { "<leader>fc",       function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end },
        { "<leader>fh",       function() Snacks.picker.help() end },
        { "<leader>fg",       function() Snacks.picker.grep() end },
        { "<leader>ff",       function() Snacks.picker.files() end },
        { "<leader>cc",       function() Snacks.picker.colorschemes() end },
        { "<leader>bo",       function() Snacks.bufdelete.other() end },
    },
}
