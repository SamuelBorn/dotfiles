return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "folke/lazydev.nvim",   opts = {}, ft = "lua" },
        { "mason-org/mason.nvim", opts = {} },
        {
            "mason-org/mason-lspconfig.nvim",
            opts = {
                ensure_installed = {
                    "clangd",
                    "lua_ls",
                    "pyright",
                    "ruff",
                    "texlab",
                    "jdtls",
                },
            },
        },
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
                vim.keymap.set("n", "grd", function() Snacks.picker.lsp_definitions() end)
                vim.keymap.set("n", "grr", function() Snacks.picker.lsp_references() end)
                vim.keymap.set("n", "grs", function() Snacks.picker.lsp_workspace_symbols() end)
                vim.keymap.set("n", "<leader>i",
                    function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end)
            end
        })
    end,
}
