return {
	"folke/snacks.nvim",
	lazy = false,
	opts = {
		explorer = {
			replace_netrw = true,
		},
		picker = {
			win = {
				input = {
					keys = {
						["<Esc>"] = { "close", mode = { "i", "n" } },
						["<C-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
						["<C-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
					},
				},
			},
			layouts = {
				default = {
					layout = {
						box = "horizontal",
						width = 0.8,
						min_width = 120,
						height = 0.8,
						{
							box = "vertical",
							border = "rounded",
							title = "{title} {live} {flags}",
							{ win = "input", height = 1, border = "bottom" },
							{ win = "list", border = "none" },
						},
						{ win = "preview", title = "{preview}", border = "rounded", width = 0.6 },
					},
				},
			},
		},
	},
	keys = {
		-- Picker
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find files",
		},
		{
			"<leader>fd",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Find diagnostics",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.resume()
			end,
			desc = "Find resume",
		},
		{
			"<leader>fu",
			function()
				Snacks.picker.undo()
			end,
			desc = "Find undo",
		},
		{
			'<leader>f"',
			function()
				Snacks.picker.registers()
			end,
			desc = "Find registers",
		},
		{
			"<leader>fn",
			function()
				Snacks.picker.files({ cwd = "~/Notes/" })
			end,
			desc = "Find notes",
		},
		{
			"<leader>fw",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "Find word",
		},
		{
			"<leader>fL",
			function()
				Snacks.picker.git_log_file()
			end,
			desc = "Find log file",
		},
		{
			"<leader>fl",
			function()
				Snacks.picker.lines()
			end,
			desc = "Find lines",
		},
		{
			"<leader>fk",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Find keymaps",
		},
		{
			"<leader>f.",
			function()
				Snacks.picker.recent()
			end,
			desc = "Find recent files",
		},
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers({
					on_show = function()
						vim.cmd.stopinsert()
					end,
					win = {
						input = {
							keys = {
								["d"] = "bufdelete",
							},
						},
					},
				})
			end,
			desc = "Find buffers",
		},
		{
			"<leader>fc",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find config files",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.git_files()
			end,
			desc = "Find git files",
		},
		{
			"<leader>fh",
			function()
				Snacks.picker.help()
			end,
			desc = "Find help",
		},
		{
			"<leader>f/",
			function()
				Snacks.picker.grep()
			end,
			desc = "Find grep",
		},
		{
			"<leader>fp",
			function()
				Snacks.picker.projects()
			end,
			desc = "Find projects",
		},
		{
			"<leader>f:",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Find commands",
		},
		{
			"<leader>fm",
			function()
				Snacks.picker.man()
			end,
			desc = "Find man pages",
		},
		{
			"<leader>fz",
			function()
				Snacks.picker.zoxide()
			end,
			desc = "Find zoxide",
		},
		-- Explorer
		{
			"<leader>e",
			function()
				Snacks.explorer()
			end,
			desc = "File explorer",
		},
	},
}
