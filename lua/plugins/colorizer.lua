vim.pack.add({
	"https://github.com/catgoose/nvim-colorizer.lua",
})
require("colorizer").setup({
	filetypes = {
		"javascript",
		"typescript",
		"javascriptreact",
		"typescriptreact",
	},
	display = {
		mode = "virtualtext",
		virtualtext = {
			char = " ",
			position = "before",
		},
	},
})
