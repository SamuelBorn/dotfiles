return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "danielfalk/smart-open.nvim",               dependencies = "kkharji/sqlite.lua" },
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    event = "VeryLazy",
    config = function()
        require('telescope').setup({ extensions = { smart_open = { match_algorithm = "fzf" } } })
        require("telescope").load_extension("fzf")
        require("telescope").load_extension("smart_open")

        vim.keymap.set("n", "<leader><leader>", require("telescope").extensions.smart_open.smart_open)
        vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files)
        vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep)
        vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags)
    end,
}
