return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "williamboman/mason.nvim",          opts = {} },
        { "williamboman/mason-lspconfig.nvim" },
        { "folke/neodev.nvim",                opts = {} },
        { "j-hui/fidget.nvim",                opts = {} },
    },
    config = function()
        local on_attach = function(client, bufnr)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

            vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions)
            vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references)
            vim.keymap.set("n", "gI", require("telescope.builtin").lsp_implementations)
            vim.keymap.set("n", "gt", require("telescope.builtin").lsp_type_definitions)
            vim.keymap.set("n", "gh", vim.lsp.buf.declaration)

            vim.keymap.set({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help)

            -- shortcut to enable inlay hints with leader i
            vim.keymap.set("n", "<leader>i",
                function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end)
        end

        local servers = {
            clangd = {
                cmd = { "clangd", "--offset-encoding=utf-16", "--header-insertion=never" },
            },
            glsl_analyzer = {},
            html = {},
            lua_ls = { settings = { Lua = { hint = { enable = true } } } },
            pyright = {},
            rust_analyzer = {},
            yamlls = {},
            texlab = {},
            rnix = {},
        }

        require("mason-lspconfig").setup({ ensure_installed = vim.tbl_keys(servers) })
        require("mason-lspconfig").setup_handlers({
            function(server_name)
                servers[server_name].capabilities = require("cmp_nvim_lsp").default_capabilities()
                servers[server_name].on_attach = on_attach
                require("lspconfig")[server_name].setup(servers[server_name])
            end,
        })
    end,
}
