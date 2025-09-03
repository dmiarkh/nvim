return {
	"obsidian-nvim/obsidian.nvim",
	version = "*",
	ft = "markdown",
	cmd = "Obsidian New",
	event = {
		"BufReadPre " .. vim.fn.expand("~" .. "/Notes/*.md"),
		"BufNewFile " .. vim.fn.expand("~" .. "/Notes/*.md"),
	},
	keys = {
		{ "<leader>fo", "<cmd>Obsidian search<cr>", desc = "Find obsidian" },
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
			min_chars = 2,
		},
		new_notes_location = "notes_subdir",
		note_id_func = function(title)
			return tostring(os.time()) .. "-" .. title
		end,
		wiki_link_func = "use_alias_only",
		picker = {
			name = "snacks.pick",
		},
		legacy_commands = false,
	},
}
