return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },
	opts = {
		checkbox = {
			checked = { scope_highlight = "@markup.strikethrough" },
		},
	},
	ft = { "markdown" },
	init = function()
		vim.g.markdown_render_enabled = true
	end,
}
