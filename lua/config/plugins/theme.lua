return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
            -- TODO: transparent except specific hl groups

			-- transparent_background = true,
			integrations = {
			-- 	harpoon = true,
				mason = true,
			-- 	lsp_trouble = true,
				which_key = true,
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
