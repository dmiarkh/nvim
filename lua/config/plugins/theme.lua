return {
	-- "folke/tokyonight.nvim",
	-- lazy = false,
	-- priority = 1000,
	-- config = function()
	-- 	require("tokyonight").setup({
	-- 		transparent = true,
	-- 		style = "night",
	-- 	})
	--
	-- 	vim.cmd.colorscheme("tokyonight")
	-- 	-- You can configure highlights by doing something like
	-- 	-- vim.cmd.hi 'Comment gui=none'
	-- end,

	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			transparent_background = true,
			integrations = {
				harpoon = true,
				mason = true,
				lsp_trouble = true,
				which_key = true,
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
