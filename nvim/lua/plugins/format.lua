return {
    "stevearc/conform.nvim",
    dependencies = { "WhoIsSethDaniel/mason-tool-installer.nvim" },
    config = function()
        local formatters_by_ft = {
            javascript = { "prettierd" },
            markdown = { "mdformat" },
            python = { "isort", "black" },
            sh = { "shfmt" },
        }
        require('mason-tool-installer').setup { ensure_installed = vim.tbl_flatten(vim.tbl_values(formatters_by_ft)) }
        require("conform").setup({ formatters_by_ft = formatters_by_ft })
        vim.keymap.set("n", "<leader>l", function() require('conform').format({ lsp_fallback = true }) end)
    end
}
