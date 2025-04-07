---@type vim.lsp.Config
return {
	cmd = { "vscode-json-language-server", "--stdio" },
	filetypes = { "json", "jsonc" },
	root_markers = { "package.json", "tsconfig.json", ".git", "jsonconfig.json" },
	settings = {
		json = {
			schemas = [=[
        {
          "fileMatch": ["package.json"],
          "url": "https://json.schemastore.org/package.json"
        },
        {
          "fileMatch": ["tsconfig.json", "tsconfig.*.json"],
          "url": "https://json.schemastore.org/tsconfig.json"
        },
        {
          "fileMatch": [".prettierrc", ".prettierrc.json", "prettier.config.json"],
          "url": "https://json.schemastore.org/prettierrc.json"
        },
        {
          "fileMatch": [".eslintrc", ".eslintrc.json"],
          "url": "https://json.schemastore.org/eslintrc.json"
        }
      ]=],
			validate = {
				enable = true,
			},
		},
	},
}
