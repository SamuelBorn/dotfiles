return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "folke/lazydev.nvim",               opts = {}, ft = "lua" },
        { "mason-org/mason.nvim",          opts = {} },
        { "mason-org/mason-lspconfig.nvim" },
    },
    config = function()
        vim.api.nvim_create_autocmd("CursorHold", {
            callback = function() vim.diagnostic.open_float(nil, { focusable = false }) end
        })

        vim.api.nvim_create_autocmd("LspProgress", {
            callback = function()
                vim.notify(vim.lsp.status(), vim.log.levels.TRACE, {
                    id = "lsp_progress",
                    title = "LSP Progress",
                })
            end,
        })

        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function()
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
                vim.keymap.set("n", "<leader>ds", function() Snacks.picker.lsp_workspace_symbols() end)
                vim.keymap.set("n", "gd", function() Snacks.picker.lsp_definitions() end)
                vim.keymap.set("n", "gr", function() Snacks.picker.lsp_references() end)

                vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help)

                vim.keymap.set("n", "<leader>i",
                    function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end)
            end
        })

        local servers = {
            "clangd",
            "lua_ls",
            "pyright",
            "ruff",
            -- "rust_analyzer",
            "texlab",
            "jdtls",
        }

        require("mason-lspconfig").setup({ ensure_installed = servers })

        for _, server in ipairs(servers) do
            vim.lsp.enable(server)
        end
    end,
}
