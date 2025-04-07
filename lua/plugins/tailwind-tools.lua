return {
	"luckasRanarison/tailwind-tools.nvim",
	name = "tailwind-tools",
	ft = { "javascriptreact", "typescriptreact", "javascript", "typescript", "css" },
	build = ":UpdateRemotePlugins",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		conceal = {
			symbol = "󱏿 ",
		},
	},
	keys = {
		{ "<leader>th", "<cmd>TailwindConcealToggle<cr>", desc = "Toggle tailwind conceal" },
		{ "<leader>tc", "<cmd>TailwindColorToggle<cr>", desc = "Toggle tailwind color" },
		{ "<leader>ts", "<cmd>TailwindSort<cr>", desc = "Toggle sort" },
	},
}
