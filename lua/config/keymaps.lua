vim.keymap.set("n", "<Esc>", "<CMD>nohlsearch<CR>")

-- Splits
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split vertically" })
vim.keymap.set("n", "<leader>sx", "<CMD>close<CR>", { desc = "Close split" })

-- Quickfix
vim.keymap.set("n", "<leader>qn", "<CMD>cnext<CR>", { desc = "Next quickfix" })
vim.keymap.set("n", "<leader>qp", "<CMD>cprev<CR>", { desc = "Previous quickfix" })

-- Paste without replacing paste buffer
vim.keymap.set("v", "p", '"_dP')

-- Move single line
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")

-- Move multiple lines in visual mode
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
