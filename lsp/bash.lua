---@type vim.lsp.Config
return {
	cmd = { "bash-language-server", "start" },
	filetypes = { "sh", "bash" },
	-- root_dir = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":p:h"),
	settings = {
		bashIde = {
			globPattern = "*@(.sh|.inc|.bash|.command)",
		},
	},
}
