return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "modern",
		delay = 600,
		-- spec = {
		-- 	{ "<leader>f", group = "Find" },
		-- 	{ "<leader>e", group = "File explorer" },
		-- 	{ "<leader>s", group = "Split", icon = "" },
		-- 	{ "<leader>p", group = "Previous", icon = "" },
		-- 	{ "<leader>n", group = "Next", icon = "" },
		-- 	{ "<leader>x", group = "Diagnostics/Quickfix" },
		-- 	{ "<leader>h", group = "Harpoon", icon = "" },
		-- 	{ "<leader>H", group = "Git hunk" },
		-- 	-- { "<leader>d", group = "Document", icon = "" },
		-- 	{ "<leader>w", group = "Workspace", icon = "" },
		-- 	{ "<leader>c", desc = "Code" },
		-- 	{ "<leader>l", desc = "LSP", icon = "" },
		-- 	{ "<leader>r", desc = "Rename", icon = "" },
		-- 	{ "<leader>u", desc = "Undo tree", icon = "" },
		-- 	{ "<leader>-", desc = "Close Oil", icon = "" },
		-- },
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
