return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "modern",
		delay = 1000,
		spec = {
			{ "<leader>.", group = "Session" },
			{ "<leader>b", group = "Buffer" },
			{ "<leader>c", group = "Code" },
			{ "<leader>f", group = "Find" },
			{ "<leader>g", group = "Git" },
			{ "<leader>h", group = "Harpoon", icon = { icon = "󱡀", color = "cyan" } },
			{ "<leader>n", group = "Notification" },
			{ "<leader>q", group = "Quickfix" },
			{ "<leader>r", desc = "Rename", icon = { icon = "", color = "azure" } },
			{ "<leader>s", group = "Symbols", icon = { icon = "§", color = "green" } },
			{ "<leader>t", group = "Tailwind", icon = { icon = "󱏿 ", color = "blue" } },
			{ "<leader>u", group = "UI" },
			-- { "<leader>U", desc = "Undo tree", icon = { icon = "", color = "red" } },
			-- -- { "<leader>x", group = "Trouble", icon = { icon = "", color = "orange" } },
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Which-key keymaps",
		},
	},
}
