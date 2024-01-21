return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        require("telescope").load_extension("fzf")
        require("telescope").setup({ pickers = { help_tags = { mappings = { i = { ["<CR>"] = "file_vsplit" } } } } })

        vim.keymap.set("n", "<leader>ff", function() require("telescope.builtin").find_files() end)
        vim.keymap.set("n", "<leader>fb", function() require("telescope.builtin").buffers() end)
        vim.keymap.set("n", "<leader>fg", function() require("telescope.builtin").live_grep() end)
        vim.keymap.set("n", "<leader>fh", function() require("telescope.builtin").help_tags() end)
        vim.keymap.set("n", "<leader>fe", function()
            require("telescope.builtin").find_files({
                cwd = "~",
                search_dirs = { "~/Repos/", "~/Dropbox/" },
                file_ignore_patterns = { "venv", ".venv", "%.docx", "%.pyi", "%.pyc", "%.png", "%.jpg", "%.pdf", "%.svg", "%.note" },
            })
        end)
    end,
}
