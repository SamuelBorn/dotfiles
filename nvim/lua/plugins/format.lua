return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                python = { "isort", "black" },
                sh = { "shfmt" },
            },
        })
    end,
    keys = {
        { "<leader>l", mode = "n", function() require("conform").format({ lsp_fallback = true }) end },
    },
}
