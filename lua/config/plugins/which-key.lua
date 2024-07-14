return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "modern",
		spec = {
			{ "<leader>e", group = "File explorer" },
			{ "<leader>f", group = "Find" },
			{ "<leader>s", group = "Split" },
			{ "<leader>p", group = "Previous" },
			{ "<leader>n", group = "Next" },
			{ "<leader>x", group = "Trouble" },
			{ "<leader>h", group = "Harpoon" },
			{ "<leader>H", group = "Git hunk" },
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
