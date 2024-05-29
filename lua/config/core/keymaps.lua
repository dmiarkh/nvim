vim.keymap.set("n", "<Esc>", "<CMD>nohlsearch<CR>")

-- Splits
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split vertically" })
vim.keymap.set("n", "<leader>sx", "<CMD>close<CR>", { desc = "Close split" })

-- Quickfix
vim.keymap.set("n", "<leader>nq", "<CMD>cnext<CR>", { desc = "Next quickfix" })
vim.keymap.set("n", "<leader>pq", "<CMD>cprev<CR>", { desc = "Previous quickfix" })

-- Paste without replacing paste buffer
vim.keymap.set("v", "p", '"_dP')
