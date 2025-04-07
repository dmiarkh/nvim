local ensure_installed = {
	"bash-language-server",
	"biome",
	"css-lsp",
	"emmet-language-server",
	"html-lsp",
	"json-lsp",
	"lua-language-server",
	"tailwindcss-language-server",
	"typescript-language-server",
	-- prisma
	-- graphql

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
	"williamboman/mason.nvim",
	-- NOTE: run :MasonToolsInstall for ensure_installed
	cmd = "Mason",
	event = "VeryLazy",
	build = ":MasonUpdate",
	dependencies = { "WhoIsSethDaniel/mason-tool-installer.nvim" },
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
			ensure_installed = ensure_installed,
		})
	end,
}
