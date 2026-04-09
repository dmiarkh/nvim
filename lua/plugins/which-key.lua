vim.pack.add({ "https://github.com/folke/which-key.nvim" })

require("which-key").setup({
	preset = "modern",
	delay = 1000,
	spec = {
		{ "<leader>.", group = "Session" },
		{ "<leader>b", group = "Buffer" },
		{ "<leader>f", group = "Find" },
		{ "<leader>g", group = "Git" },
		{ "<leader>h", group = "Harpoon", icon = { icon = "󱡀", color = "cyan" } },
		{ "<leader>n", group = "Notification" },
		-- { "<leader>q", group = "Quickfix" },
		-- { "<leader>t", group = "Tailwind", icon = { icon = "󱏿 ", color = "blue" } },
		{ "<leader>u", group = "UI" },
		-- -- { "<leader>x", group = "Trouble", icon = { icon = "", color = "orange" } },
	},
})
