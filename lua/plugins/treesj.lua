return {
	"Wansmer/treesj",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	opts = {},
	keys = {
		{ "<leader>cj", "<cmd>TSJJoin<cr>", desc = "Join code block" },
		{ "<leader>cs", "<cmd>TSJSplit<cr>", desc = "Split code block" },
		{ "<leader>ct", "<cmd>TSJToggle<cr>", desc = "Toggle code block" },
	},
}
