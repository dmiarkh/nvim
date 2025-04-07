return {
	"folke/todo-comments.nvim",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	cmd = { "TodoTrouble", "TodoTelescope" },
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
	keys = {
		{
			"]t",
			function()
				require("todo-comments").jump_next()
			end,
			desc = "Next Todo Comment",
		},
		{
			"[t",
			function()
				require("todo-comments").jump_prev()
			end,
			desc = "Previous Todo Comment",
		},
		{
			"<leader>ft",
			function()
				Snacks.picker.todo_comments()
			end,
			desc = "Find todo",
		},
	},
}
