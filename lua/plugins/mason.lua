local lsp_to_install = {
	"bashls",
	"cssls",
	"emmet_language_server",
	"eslint",
	"gopls",
	"html",
	"jsonls",
	"lua_ls",
	"tailwindcss",
	"ts_ls",
}

local tools_to_install = {
	"black",
	"eslint_d",
	"isort",
	"prettier",
	"prettierd",
	"shellcheck",
	"shfmt",
	"stylua",
}

return {
	"mason-org/mason.nvim",
	-- NOTE: run :MasonToolsInstall for ensure_installed
	cmd = "Mason",
	event = "VeryLazy",
	build = ":MasonUpdate",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"mason-org/mason-lspconfig.nvim",
	},
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "×",
				},
				border = "rounded",
			},
		})
		require("mason-tool-installer").setup({
			ensure_installed = tools_to_install,
		})
		require("mason-lspconfig").setup({
			ensure_installed = lsp_to_install,
		})
	end,
}
