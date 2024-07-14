return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-ui-select.nvim",
		"folke/todo-comments.nvim",
	},
	config = function()
		require("telescope").setup({
			defaults = {
				path_display = { "smart" },
				file_ignore_patterns = {
					"node%_modules/.*",
				},
			},
		})

		local open_with_trouble = require("trouble.sources.telescope").open
		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				mappings = {
					i = { ["<c-t>"] = open_with_trouble },
					n = { ["<c-t>"] = open_with_trouble },
				},
			},
		})

		require("telescope").load_extension("fzf")
		require("telescope").load_extension("ui-select")

		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
		vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = "Find recent" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find grep" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })
		vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Find word" })
		vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "Find resume" })
		vim.keymap.set("n", "<leader>fi", builtin.git_files, { desc = "Fing git" })
		vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Find diagnostics" })
		vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find keymaps" })
		vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find todos" })
		vim.keymap.set("n", "<leader>fn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "Find neovim files" })
		vim.keymap.set("n", "<leader>fo", function()
			builtin.find_files({ cwd = "~/Notes/" })
		end, { desc = "Find notes" })
	end,
}
