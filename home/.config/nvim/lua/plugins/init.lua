return {
    { "echasnovski/mini.surround", event = "VeryLazy", opts = {} },
    { "github/copilot.vim",        event = "VeryLazy" },
    {
        "stevearc/oil.nvim",
        opts = {
            view_options = { show_hidden = true };
        },
        keys = { { "-", "<cmd>Oil<cr>" } },
    },
}
