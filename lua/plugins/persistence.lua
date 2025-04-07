return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	opts = {},
	keys = {
		{
			"<leader>.s",
			function()
				require("persistence").load()
			end,
			desc = "Restore Session",
		},
		{
			"<leader>.S",
			function()
				require("persistence").select()
			end,
			desc = "Select Session",
		},
		{
			"<leader>.l",
			function()
				require("persistence").load({ last = true })
			end,
			desc = "Restore Last Session",
		},
		{
			"<leader>.d",
			function()
				require("persistence").stop()
			end,
			desc = "Don't Save Current Session",
		},
	},
}
