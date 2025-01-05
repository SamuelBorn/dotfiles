return {
    { "echasnovski/mini.surround", event = "VeryLazy", opts = {} },
    { "echasnovski/mini.ai",       event = "VeryLazy", opts = {} },
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy",
        config = function()
            vim.diagnostic.config({ virtual_text = false })
            require("tiny-inline-diagnostic").setup()
        end
    },
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
}
