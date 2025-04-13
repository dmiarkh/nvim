return {
	"luckasRanarison/tailwind-tools.nvim",
	name = "tailwind-tools",
	ft = { "javascriptreact", "typescriptreact", "javascript", "typescript", "css" },
	build = ":UpdateRemotePlugins",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	init = function()
		vim.g.tailwind_tools_conceal = false
		vim.g.tailwind_tools_color = true
	end,
	opts = {
		conceal = {
			symbol = "󱏿 ",
		},
	},
	config = function(_, opts)
		require("tailwind-tools").setup(opts)

		Snacks.toggle({
			name = "tailwind conceal",
			get = function()
				return vim.g.tailwind_tools_conceal
			end,
			set = function(state)
				vim.g.tailwind_tools_conceal = state
				vim.cmd("TailwindConceal" .. (state and "Enable" or "Disable"))
			end,
		}):map("<leader>th")

		Snacks.toggle({
			name = "tailwind color",
			get = function()
				return vim.g.tailwind_tools_color
			end,
			set = function(state)
				vim.g.tailwind_tools_color = state
				vim.cmd("TailwindColor" .. (state and "Enable" or "Disable"))
			end,
		}):map("<leader>tc")

		vim.keymap.set("n", "<leader>ts", "<cmd>TailwindSort<cr>", { desc = "Sort classes" })
	end,
}
