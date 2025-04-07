return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	opts = {
		formatters_by_ft = {
			css = { "prettierd", "prettier", stop_after_first = true },
			graphql = { "prettierd", "prettier", stop_after_first = true },
			html = { "prettierd", "prettier", stop_after_first = true },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			javascriptreact = { "prettierd", "prettier", stop_after_first = true },
			json = { "prettierd", "prettier", stop_after_first = true },
			jsonc = { "prettierd", "prettier", stop_after_first = true },
			lua = { "stylua" },
			markdown = { "prettierd", "prettier", stop_after_first = true },
			python = { "isort", "black", stop_after_first = true },
			sh = { "shfmt" },
			typescript = { "prettierd", "prettier", stop_after_first = true },
			typescriptreact = { "prettierd", "prettier", stop_after_first = true },
			yaml = { "prettierd", "prettier", stop_after_first = true },
		},
		-- To disable lsp fallback for certain ls, see kickstart implementation
		format_on_save = function()
			if vim.g.autoformat_disabled then
				return
			end
			return {
				timeout_ms = 500,
				lsp_format = "fallback",
			}
		end,
	},
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			desc = "Format",
		},
	},
}
