---@type vim.lsp.Config
return {
	cmd = { "emmet-language-server", "--stdio" },
	single_file_support = true,
	root_markers = { "tsconfig.json", "jsconfig.json", "package.json", "index.html", ".git" },
	filetypes = {
		"astro",
		"css",
		"eruby",
		"html",
		"htmldjango",
		"javascript",
		"javascriptreact",
		"less",
		"pug",
		"sass",
		"scss",
		"svelte",
		"typescriptreact",
		"vue",
		"htmlangular",
	},
	settings = {
		init_options = {
			jsx = {
				options = {
					["jsx.enabled"] = true,
					["markup.attributes"] = {
						["class"] = "className",
						["class*"] = "className",
						["for"] = "htmlFor",
					},
					["markup.valuePrefix"] = {
						["class*"] = "styles",
					},
				},
			},
		},
	},
}
