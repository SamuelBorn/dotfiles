return {
    "stevearc/conform.nvim",
    dependencies = { "zapling/mason-conform.nvim", "neovim/nvim-lspconfig" },
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                javascript = { { "prettierd", "prettier" } },
                markdown = { "mdformat" },
                python = { "isort", "black" },
                sh = { "shfmt" },
            }
        })
        vim.keymap.set("n", "<leader>l", function() require('conform').format({ lsp_fallback = true }) end)
        require("mason-conform").setup()
    end
}
