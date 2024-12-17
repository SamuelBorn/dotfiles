return {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "danielfalk/smart-open.nvim" },
        { "kkharji/sqlite.lua" },
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        require('telescope').setup({ extensions = { smart_open = { match_algorithm = "fzf" } } })
        require("telescope").load_extension("fzf")
        require("telescope").load_extension("smart_open")
    end,
    keys = {
        { "<leader><leader>", ":Telescope smart_open<CR>" },
        { "<leader>ff",       require("telescope.builtin").find_files },
        { "<leader>fg",       require("telescope.builtin").live_grep },
        { "<leader>fh",       require("telescope.builtin").help_tags },
    },
}
