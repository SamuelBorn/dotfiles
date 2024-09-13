return {
    "stevearc/conform.nvim",
    dependencies = { "williamboman/mason.nvim", "zapling/mason-conform.nvim" },
    event = "VeryLazy",
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
            }
        })
        vim.keymap.set("n", "<leader>l", function() require('conform').format({ lsp_format = "fallback" }) end)
        require("mason-conform").setup()
    end
}
