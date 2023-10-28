return {
	"windwp/nvim-autopairs",
	dependencies = { "hrsh7th/nvim-cmp" },
	config = function()
        -- Add braces on function cmp
		require("nvim-autopairs").setup({})
		require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
	end,
}
