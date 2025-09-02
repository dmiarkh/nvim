return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = {},
		bufdelete = {},
		image = {},
		indent = {
			animate = { enabled = false },
			filter = function(buf)
				return vim.g.snacks_indent ~= false
					and vim.b[buf].snacks_indent ~= false
					and vim.bo[buf].buftype == ""
					and vim.bo[buf].filetype ~= "markdown"
			end,
		},
		input = {},
		notifier = {},
		quickfile = {},
		statuscolumn = {},
		toggle = {},
	},
	keys = {
		-- Notifier
		{
			"<leader>nh",
			function()
				Snacks.notifier.show_history()
			end,
			desc = "Notification history",
		},
		{
			"<leader>gb",
			function()
				Snacks.git.blame_line()
			end,
			desc = "Blame line",
		},
	},
}
