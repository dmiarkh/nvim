-- NOTE: run :Lazy build markdown-preview.nvim for the first time
return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	build = ":call mkdp#util#install()",
	keys = {
		{ "<F5>", "<cmd>MarkdownPreviewToggle<cr>", "Toggle markdown preview" },
	},
}
