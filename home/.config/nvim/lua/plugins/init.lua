return {
    { "echasnovski/mini.surround", event = "VeryLazy", opts = {} },
    { "echasnovski/mini.ai",       event = "VeryLazy", opts = {} },
    {
        "zbirenbaum/copilot.lua",
        event = "InsertEnter",
        opts = {
            suggestion = {
                auto_trigger = true,
                keymap = {
                    accept_line = "<A-l>"
                }
            },
        }
    },
    {
        "stevearc/oil.nvim",
        opts = {
            view_options = { show_hidden = true },
        },
        keys = { { "-", "<cmd>Oil<cr>" } },
    },
}
