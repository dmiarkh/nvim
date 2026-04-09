vim.pack.add({ "https://github.com/stevearc/oil.nvim" })

require("oil").setup({
	default_file_explorer = false,
	view_options = {
		show_hidden = true,
	},
	delete_to_trash = true,
	float = {
		-- Padding around the floating window
		padding = 4,
		max_width = 160,
		max_height = 0,
		border = "rounded",
		win_options = {
			winblend = 0,
		},
	},
})

vim.keymap.set("n", "-", "<cmd>Oil --float<cr>", { desc = "Open Oil" })
