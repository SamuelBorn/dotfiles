return {
    { "echasnovski/mini.surround", event = "VeryLazy", opts = {} },
    {
        "github/copilot.vim",
        event = "VeryLazy",
        config = function()
            vim.keymap.set('i', '<C-o>', '<Plug>(copilot-accept-word)')
        end
    },
    {
        "stevearc/oil.nvim",
        opts = {
            view_options = { show_hidden = true },
        },
        keys = { { "-", "<cmd>Oil<cr>" } },
    },
}
