return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        { "folke/neodev.nvim", opts = {} },
        { "j-hui/fidget.nvim", opts = {} },
    },
    config = function()
        local on_attach = function(client, bufnr)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

            vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions)
            vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references)
            vim.keymap.set("n", "gI", require("telescope.builtin").lsp_implementations)

            vim.keymap.set("n", "K", vim.lsp.buf.hover)
            vim.keymap.set({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help)

            -- if client.server_capabilities.inlayHintProvider then
            --     vim.lsp.inlay_hint.enable(bufnr, true)
            -- end
        end

        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "clangd",
                "html",
                "jsonls",
                "lua_ls",
                "pyright",
                "rust_analyzer",
                "tsserver",
                "yamlls",
                "glsl_analyzer",
            },
        })
        require("mason-lspconfig").setup_handlers({
            function(server_name)
                require("lspconfig")[server_name].setup({
                    capabilities = require("cmp_nvim_lsp").default_capabilities(),
                    on_attach = on_attach,
                })
            end,

            -- special setup for clangd
            ["clangd"] = function()
                require("lspconfig").clangd.setup {
                    cmd = { "clangd", "--offset-encoding=utf-16", "--header-insertion=never" },
                    capabilities = require("cmp_nvim_lsp").default_capabilities(),
                    on_attach = on_attach,
                }
            end,
        })
    end,
}
