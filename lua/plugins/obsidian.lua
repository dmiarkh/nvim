return {
	-- "epwalsh/obsidian.nvim",
	"obsidian-nvim/obsidian.nvim",
	version = "*",
	cmd = "ObsidianNew",
	event = {
		"BufReadPre " .. vim.fn.expand("~" .. "/Notes/*.md"),
		"BufNewFile " .. vim.fn.expand("~" .. "/Notes/*.md"),
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "personal",
				path = "~/Notes/",
			},
		},
		ui = {
			enable = false,
		},
		completion = {
			blink = true,
		},
		-- new_notes_location = "current_dir",
	},
}
