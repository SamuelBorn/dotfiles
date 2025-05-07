return {
    { "echasnovski/mini.surround", event = "VeryLazy", opts = {} },
    {
        "zbirenbaum/copilot.lua",
        event = "InsertEnter",
        opts = {
            suggestion = {
                auto_trigger = true,
                keymap = {
                    accept = "<C-Enter>",
                    accept_word = "<A-Enter>"
                }
            },
        }
    },
    {
        "stevearc/oil.nvim",
        opts = { view_options = { show_hidden = true } },
        keys = { { "-", "<cmd>Oil<cr>" } },
    },
    {
        'mrcjkb/rustaceanvim',
        lazy = false,
        keys = {
            { "<leader>rt", function() vim.cmd.RustLsp('testables') end }
        },
    }
}
