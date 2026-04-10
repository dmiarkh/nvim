vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>")

vim.keymap.set({ "n", "x" }, "j", "v:count ? 'j' : 'gj'", { desc = "Down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count ? 'k' : 'gk'", { desc = "Up", expr = true, silent = true })

-- Clipboard
vim.keymap.set("n", "<leader>y", '"+y$', { desc = "Yank line to clipboard" })
vim.keymap.set("n", "<leader>Y", 'm`_"+y$``', { desc = "Yank line to clipboard" })
vim.keymap.set({ "v", "x" }, "<leader>y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set({ "n", "x" }, "<leader>p", '"+p', { desc = "Paste from the clipboard" })
vim.keymap.set({ "n", "x" }, "<leader>P", '"+P', { desc = "Paste from the clipboard" })
vim.keymap.set("v", "<leader>p", '"_d"+p', { desc = "Paste from the clipboard" })
vim.keymap.set("v", "p", '"_dP')

-- Move Lines
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==")
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==")
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi")
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi")
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { silent = true })

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

vim.keymap.set("n", "<leader>vu", ":lua vim.pack.update()<cr>", { desc = "Update plugins", silent = true })
vim.keymap.set(
	"n",
	"<leader>vl",
	":lua vim.pack.update(nil, { offline = true })<cr>",
	{ desc = "List installed plugins", silent = true }
)
vim.keymap.set(
	"n",
	"<leader>vr",
	":lua vim.pack.update(nil, { target = 'lockfile' })<cr>",
	{ desc = "Restore plugins from the lockfile", silent = true }
)
