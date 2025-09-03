return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	keys = {
		{ "<F5>", "<cmd>MarkdownPreviewToggle<cr>", "Toggle markdown preview" },
	},
	build = function()
		-- run :Lazy build markdown-preview at first launch
		vim.fn["mkdp#util#install"]()
	end,
}
