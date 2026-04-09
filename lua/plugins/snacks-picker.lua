local map = vim.keymap.set

-- Explorer
map("n", "<leader>e", function()
	Snacks.explorer()
end, { desc = "File explorer" })

-- Picker
map("n", "<leader>ff", function()
	Snacks.picker.files()
end, { desc = "Find files" })
map("n", "<leader>fd", function()
	Snacks.picker.diagnostics()
end, { desc = "Find diagnostics" })
map("n", "<leader>fr", function()
	Snacks.picker.resume()
end, { desc = "Find resume" })
map("n", "<leader>fu", function()
	Snacks.picker.undo()
end, { desc = "Find undo" })
map("n", '<leader>f"', function()
	Snacks.picker.registers()
end, { desc = "Find registers" })
map("n", "<leader>fn", function()
	Snacks.picker.files({ cwd = "~/Notes/" })
end, { desc = "Find notes" })
map("n", "<leader>fw", function()
	Snacks.picker.grep_word()
end, { desc = "Find word" })
map("n", "<leader>fL", function()
	Snacks.picker.git_log_file()
end, { desc = "Find log file" })
map("n", "<leader>fl", function()
	Snacks.picker.lines()
end, { desc = "Find lines" })
map("n", "<leader>fk", function()
	Snacks.picker.keymaps()
end, { desc = "Find keymaps" })
map("n", "<leader>f.", function()
	Snacks.picker.recent()
end, { desc = "Find recent files" })
map("n", "<leader>fb", function()
	Snacks.picker.buffers({
		on_show = function()
			vim.cmd.stopinsert()
		end,
		win = { input = { keys = { ["d"] = "bufdelete" } } },
	})
end, { desc = "Find buffers" })
map("n", "<leader>fc", function()
	Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Find config files" })
map("n", "<leader>fg", function()
	Snacks.picker.git_files()
end, { desc = "Find git files" })
map("n", "<leader>fh", function()
	Snacks.picker.help()
end, { desc = "Find help" })
map("n", "<leader>f/", function()
	Snacks.picker.grep()
end, { desc = "Find grep" })
map("n", "<leader>fp", function()
	Snacks.picker.projects()
end, { desc = "Find projects" })
map("n", "<leader>f:", function()
	Snacks.picker.command_history()
end, { desc = "Find commands" })
map("n", "<leader>fm", function()
	Snacks.picker.man()
end, { desc = "Find man pages" })
map("n", "<leader>fz", function()
	Snacks.picker.zoxide()
end, { desc = "Find zoxide" })

return {
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
}
