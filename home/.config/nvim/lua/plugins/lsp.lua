return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "folke/lazydev.nvim",                     opts = {}, ft = "lua" },
        { "j-hui/fidget.nvim",                      opts = {} },
        { "rachartier/tiny-inline-diagnostic.nvim", opts = {} },
        { "williamboman/mason.nvim",                opts = {} },
        { "williamboman/mason-lspconfig.nvim" },
        { "saghen/blink.cmp" },
    },
    config = function()
        vim.diagnostic.config({ virtual_text = false })

        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function()
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
                vim.keymap.set("n", "gd", function() require("fzf-lua").lsp_definitions() end)
                vim.keymap.set("n", "gr", function() require("fzf-lua").lsp_references() end)

                vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help)

                vim.keymap.set("n", "<leader>i", function()
                    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
                end)
            end
        })

        local servers = {
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

        require("mason-lspconfig").setup({ ensure_installed = vim.tbl_keys(servers) })

        for server, config in pairs(servers) do
            config.capabilities = require('blink.cmp').get_lsp_capabilities()
            require("lspconfig")[server].setup(config)
        end
    end,
}
