return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"folke/neodev.nvim",
	},
	config = function()
		local on_attach = function()
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

			vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions)
			vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references)
			vim.keymap.set("n", "gI", require("telescope.builtin").lsp_implementations)
			vim.keymap.set("n", "<leader>D", require("telescope.builtin").lsp_type_definitions)
			vim.keymap.set("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols)

			vim.keymap.set("n", "K", vim.lsp.buf.hover)
			vim.keymap.set({"n", "i"}, "<C-k>", vim.lsp.buf.signature_help)
		end

		require("neodev").setup()
		require("mason").setup()
		require("mason-lspconfig").setup()
		require("mason-lspconfig").setup_handlers({
			function(server_name)
				require("lspconfig")[server_name].setup({
					capabilities = require("cmp_nvim_lsp").default_capabilities(),
					on_attach = on_attach,
				})
			end,
		})
	end,
}
