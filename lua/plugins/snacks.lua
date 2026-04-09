vim.pack.add({ "https://github.com/folke/snacks.nvim" })

local Snacks = require("snacks")

local config = {
	bigfile = {},
	bufdelete = {},
	image = {},
	indent = {
		animate = { enabled = false },
		filter = function(buf)
			return vim.g.snacks_indent ~= false
				and vim.b[buf].snacks_indent ~= false
				and vim.bo[buf].buftype == ""
				and vim.bo[buf].filetype ~= "markdown"
		end,
	},
	input = {},
	notifier = {},
	quickfile = {},
	rename = {},
	statuscolumn = {
		folds = {
			open = true,
		},
		left = { "mark", "sign", "fold" },
		right = { "git" },
	},
	toggle = {},
}

for _, mod in ipairs({
	"plugins.snacks-picker",
	"plugins.snacks-dashboard",
}) do
	config = vim.tbl_deep_extend("force", config, require(mod))
end

Snacks.setup(config)

vim.keymap.set("n", "<leader>nh", function()
	Snacks.notifier.show_history()
end, { desc = "Notification history" })
vim.keymap.set("n", "<leader>gb", function()
	Snacks.git.blame_line()
end, { desc = "Blame line" })

-- Toggles
Snacks.toggle.option("spell", { name = "spell check" }):map("<leader>us")
Snacks.toggle.option("wrap", { name = "word wrap" }):map("<leader>uw")
Snacks.toggle.option("rnu", { name = "relative number" }):map("<leader>un")
Snacks.toggle.option("conceallevel", { name = "conceal level", on = 2, off = 0 }):map("<leader>uc")
Snacks.toggle.indent():map("<leader>ui")
Snacks.toggle({
	name = "markdown render",
	get = function()
		return vim.g.markdown_render_enabled
	end,
	set = function(state)
		vim.g.markdown_render_enabled = state
		vim.cmd("RenderMarkdown " .. (state and "enable" or "disable"))
	end,
}):map("<leader>um")
Snacks.toggle({
	name = "format on save",
	get = function()
		return not vim.g.autoformat_disabled
	end,
	set = function(state)
		vim.g.autoformat_disabled = not state
	end,
}):map("<leader>uf")
vim.keymap.set("n", "<leader>bx", function()
	Snacks.bufdelete.other()
	vim.notify("Deleted all buffers")
end, { desc = "Close all buffers but the current one" })
