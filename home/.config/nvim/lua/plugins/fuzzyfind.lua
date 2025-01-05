return {
    "ibhagwan/fzf-lua",
    opts = { lsp = { jump_to_single_result = true } },
    keys = {
        { "<leader><leader>", function() require('fzf-lua').oldfiles() end },
        { "<leader>fh",       function() require('fzf-lua').help_tags() end },
        { "<leader>fg",       function() require('fzf-lua').live_grep() end },
        { "<leader>ff",       function() require('fzf-lua').files() end },
        { "<leader>fb",       function() require('fzf-lua').buffers() end },
        { "<leader>fc",       function() require('fzf-lua').files({ cwd = vim.fn.stdpath("config") }) end },
    }
}
