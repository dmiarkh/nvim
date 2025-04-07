---@type vim.lsp.Config
return {
	cmd = { "tailwindcss-language-server", "--stdio" },
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "css", "html", "scss" },
	root_markers = {
		"tailwind.config.js",
		"tailwind.config.ts",
		"postcss.config.js",
		"package.json",
		".git",
	},
	settings = {
		tailwindCSS = {
			classAttributes = {
				"class",
				"className",
				"classList",
				"ngClass",
			},
			classFunctions = { "tw", "clsx" },
			-- experimental = {
			-- 	classRegex = {
			-- 		{ "tw`([^`]*)", 1 },
			-- 		{ 'tw="([^"]*)', 1 },
			-- 		{ "tw\\(([^)]*)\\)", 1 },
			-- 		{ "class:([^=]+)=", 1 },
			-- 		{ 'className="([^"]*)"', 1 },
			-- 	},
			-- },
			-- colorDecorators = true,
			-- colorHint = "inline",
		},
	},
}
