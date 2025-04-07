vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>")

vim.keymap.set({ "n", "x" }, "j", "v:count ? 'j' : 'gj'", { desc = "Down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count ? 'k' : 'gk'", { desc = "Up", expr = true, silent = true })

-- vim.keymap.set("n", "<leader>bx", "<cmd>%bd|e#|bd#<cr>", { desc = "Close all buffers but the current one" })
vim.keymap.set("n", "<leader>bx", function()
	Snacks.bufdelete.other()
end, { desc = "Close all buffers but the current one" })
vim.keymap.set("n", "<leader>ql", "<cmd>copen<cr>", { desc = "Open quickfix" })

-- Clipboard
vim.keymap.set("n", "<leader>y", '"+y$', { desc = "Yank line to clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste from the clipboard" })
vim.keymap.set("n", "<leader>P", '"+P', { desc = "Paste from the clipboard" })
vim.keymap.set("v", "<leader>p", '"_d"+p', { desc = "Paste from the clipboard" })
vim.keymap.set("v", "<leader>P", '"_d"+P', { desc = "Paste from the clipboard" })
vim.keymap.set("v", "p", '"_dP')

-- Move Lines
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==")
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==")
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi")
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi")
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { silent = true })

-- -- Splits
-- vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split vertically" })
-- vim.keymap.set("n", "<leader>sx", "<cmd>close<cr>", { desc = "Close split" })

-- Center the cursor when jumping
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- Windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window" })

-- Add undo break-points
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", ";", ";<c-g>u")

-- Better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- vim.snippet
vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
	if vim.snippet.active({ direction = -1 }) then
		return "<Cmd>lua vim.snippet.jump(1)<CR>"
	else
		return "<Tab>"
	end
end, { desc = "...", expr = true, silent = true })

-- Commenting
-- vim.keymap.set("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
-- vim.keymap.set("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- Toggles
Snacks.toggle.option("spell", { name = "spell check" }):map("<leader>us")
Snacks.toggle.option("rnu", { name = "relative number" }):map("<leader>un")
Snacks.toggle.option("conceallevel", { name = "conceal level", on = 2, off = 0 }):map("<leader>uc")
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
Snacks.toggle.indent():map("<leader>ui")
-- TODO: toggle blame line and possible other stuff
-- chech toggles from lazyvim
