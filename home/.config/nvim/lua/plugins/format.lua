return {
    "stevearc/conform.nvim",
    dependencies = { "zapling/mason-conform.nvim" },
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                javascript = { "prettierd" },
                json       = { "prettierd" },
                markdown   = { "prettierd" },
                html       = { "prettierd" },
                css        = { "prettierd" },
                python     = { "isort", "black" },
                sh         = { "shfmt" },
                zsh        = { "beautysh" },
                tex        = { "latexindent" },
                cmake      = { "cmake_format" },
            },
        })
        require("mason-conform").setup()
    end,
    keys = {
        { "<leader>l", function() require("conform").format({ lsp_format = "fallback" }) end },
    },
}
