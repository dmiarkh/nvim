vim.pack.add({ "https://github.com/catppuccin/nvim" })

require("catppuccin").setup({
	flavour = "mocha",
	transparent_background = true,
	float = {
		transparent = true,
	},
	integrations = {
		snacks = true,
		harpoon = true,
		mason = true,
		nvim_surround = true,
		which_key = true,
		-- native_lsp = {
		-- 	enabled = true,
		-- 	underlines = {
		-- 		errors = { "undercurl" },
		-- 		hints = { "undercurl" },
		-- 		warnings = { "undercurl" },
		-- 		information = { "undercurl" },
		-- 	},
		-- },
	},
})

vim.cmd.colorscheme("catppuccin")
