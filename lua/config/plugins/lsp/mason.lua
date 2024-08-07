return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{
			"j-hui/fidget.nvim",
			opts = {
				-- Notification setting required by catppuccin theme
				notification = {
					window = {
						winblend = 0,
					},
				},
				integration = {
					["nvim-tree"] = {
						enable = true,
					},
				},
			},
		},
	},
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		require("mason-lspconfig").setup({
			ensure_installed = {
				-- "tsserver",
				"vtsls",
				"html",
				"cssls",
				"tailwindcss",
				"lua_ls",
				"graphql",
				"emmet_ls",
				"prismals",
				"bashls",
			},
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				"prettierd",
				"stylua",
				"eslint_d",
			},
		})
	end,
}
