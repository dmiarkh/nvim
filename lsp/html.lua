---@type vim.lsp.Config
return {
	cmd = { "vscode-html-language-server", "--stdio" },
	filetypes = { "html", "htm" },
	root_markers = { "index.html", "package.json", ".git", "node_modules" },
	init_options = {
		configurationSection = { "html", "css", "javascript" },
		embeddedLanguages = {
			css = true,
			javascript = true,
		},
	},
	settings = {
		html = {
			suggest = {
				html5 = true,
			},
			validate = {
				scripts = true,
				styles = true,
			},
		},
	},
}
