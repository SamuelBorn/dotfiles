return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "folke/lazydev.nvim",               opts = {}, ft = "lua" },
        { "j-hui/fidget.nvim",                opts = {} },
        { "williamboman/mason.nvim",          opts = {} },
        { "williamboman/mason-lspconfig.nvim" },
        { "saghen/blink.cmp" },
    },
    opts = {
        servers = {
            clangd = {},
            glsl_analyzer = {},
            html = {},
            lua_ls = { settings = { Lua = { hint = { enable = true } } } },
            pyright = {},
            rust_analyzer = {},
            texlab = {},
            jdtls = {},
            cmake = {},
        }
    },
    config = function(_, opts)
        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function()
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

                vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions)
                vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references)
                vim.keymap.set("n", "gh", vim.lsp.buf.declaration)

                vim.keymap.set({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help)

                vim.keymap.set("n", "<leader>i", function()
                    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
                end)
            end
        })

        require("mason-lspconfig").setup({ ensure_installed = vim.tbl_keys(opts.servers) })
        for server, config in pairs(opts.servers) do
            config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
            require("lspconfig")[server].setup(config)
        end
    end,
}
