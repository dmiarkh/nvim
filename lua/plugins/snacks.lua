return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		image = { enabled = true },
		indent = {
			enabled = true,
			animate = { enabled = false },
			filter = function(buf)
				return vim.g.snacks_indent ~= false
					and vim.b[buf].snacks_indent ~= false
					and vim.bo[buf].buftype == ""
					and vim.bo[buf].filetype ~= "markdown"
			end,
		},
		input = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		statuscolumn = { enabled = true },
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
	},
}
