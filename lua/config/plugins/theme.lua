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
				fidget = true,
				gitsigns = true,
				harpoon = true,
				mason = true,
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
