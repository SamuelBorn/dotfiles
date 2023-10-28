return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        { "j-hui/fidget.nvim", tag = "legacy", opts = {} },
        "folke/neodev.nvim",
    },
    config = function()
        local on_attach = function()
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

            vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions)      -- go to where object is made
            vim.keymap.set("n", "gt", require("telescope.builtin").lsp_type_definitions) -- go to class of object
            vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references)       -- go to where it is also used

            vim.keymap.set("n", "gI", require("telescope.builtin").lsp_implementations)  -- go from interface to implementations
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration)                           -- go from implementation to interface

            vim.keymap.set("n", "K", vim.lsp.buf.hover)                                  -- hover documentation
            vim.keymap.set({ "i", "n" }, "<C-k>", vim.lsp.buf.signature_help)            -- display signature_help while typing function
        end

        -- add optional config to some lsp servers
        -- install new lsp servers with :Mason
        local server_settings = {
            lua_ls = {
                Lua = {
                    workspace = { checkThirdParty = false }
                }
            }
        }

        require("neodev").setup()
        require("mason").setup()
        require("mason-lspconfig").setup()
        require("mason-lspconfig").setup_handlers({
            function(server_name)
                require("lspconfig")[server_name].setup({
                    capabilities = require("cmp_nvim_lsp").default_capabilities(),
                    on_attach = on_attach,
                    settings = server_settings[server_name]
                })
            end,
        })
    end,
}
