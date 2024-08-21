return {
    "stevearc/conform.nvim",
    dependencies = { "zapling/mason-conform.nvim", "neovim/nvim-lspconfig", "williamboman/mason.nvim" },
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                javascript = { "prettierd" },
                json       = { "prettierd" },
                markdown   = { "prettierd" },
                python     = { "isort", "black" },
                sh         = { "shfmt" },
                zsh        = { "beautysh" },
            }
        })
        vim.keymap.set("n", "<leader>l", function() require('conform').format({ lsp_format = "prefer" }) end)
        require("mason-conform").setup()
    end
}
