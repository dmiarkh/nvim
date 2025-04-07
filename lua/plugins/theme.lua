return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			transparent_background = true,
			integrations = {
				blink_cmp = true,
				gitsigns = true,
				-- diffview = true,
				harpoon = true,
				markdown = true,
				mason = true,
				mini = true,
				nvim_surround = true,
				native_lsp = {
					enabled = true,
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
					},
				},
				semantic_tokens = true,
				snacks = {
					enabled = true,
					indent_scope_color = "mauve",
				},
				render_markdown = true,
				treesitter = true,
				treesitter_context = true,
				which_key = true,
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
