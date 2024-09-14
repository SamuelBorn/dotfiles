return {
	{ "echasnovski/mini.surround", opts = {}, event = "VeryLazy" },
	{ "github/copilot.vim", event = "VeryLazy" },
	{
		"stevearc/oil.nvim",
		event = "VeryLazy",
		config = function()
			require("oil").setup()
			vim.keymap.set("n", "-", "<cmd>Oil<cr>")
		end,
	},
}
