local set = vim.keymap.set

set("n", "<Esc>", "<cmd>nohlsearch<cr>")

set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- TODO: toggle options
-- LazyVim.toggle.map("<leader>uf", LazyVim.toggle.format())
-- LazyVim.toggle.map("<leader>uF", LazyVim.toggle.format(true))
-- LazyVim.toggle.map("<leader>us", LazyVim.toggle("spell", { name = "Spelling" }))
-- LazyVim.toggle.map("<leader>uw", LazyVim.toggle("wrap", { name = "Wrap" }))
-- LazyVim.toggle.map("<leader>uL", LazyVim.toggle("relativenumber", { name = "Relative Number" }))
-- LazyVim.toggle.map("<leader>ud", LazyVim.toggle.diagnostics)
-- LazyVim.toggle.map("<leader>ul", LazyVim.toggle.number)
-- LazyVim.toggle.map( "<leader>uc", LazyVim.toggle("conceallevel", { values = { 0, vim.o.conceallevel > 0 and vim.o.conceallevel or 2 } }))
-- LazyVim.toggle.map("<leader>uT", LazyVim.toggle.treesitter)
-- LazyVim.toggle.map("<leader>ub", LazyVim.toggle("background", { values = { "light", "dark" }, name = "Background" }))
-- if vim.lsp.inlay_hint then
--   LazyVim.toggle.map("<leader>uh", LazyVim.toggle.inlay_hints)
-- end

-- Quickfix
set("n", "<leader>ql", "<cmd>copen<cr>", { desc = "Open quickfix" })
set("n", "<leader>qn", "<cmd>cnext<cr>", { desc = "Next quickfix" })
set("n", "<leader>qp", "<cmd>cprev<cr>", { desc = "Previous quickfix" })

-- Paste without replacing paste buffer
set("v", "p", '"_dP')

-- Move Lines
set("n", "<A-j>", "<cmd>m .+1<cr>==")
set("n", "<A-k>", "<cmd>m .-2<cr>==")
set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi")
set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi")
set("v", "<A-j>", ":m '>+1<cr>gv=gv", { silent = true })
set("v", "<A-k>", ":m '<-2<cr>gv=gv", { silent = true })

-- Splits
set("n", "<leader>sv", "<C-w>v", { desc = "Split vertically" })
set("n", "<leader>sx", "<cmd>close<cr>", { desc = "Close split" })

-- Center the cursor when jumping
set("n", "n", "nzz")
set("n", "N", "Nzz")

-- Windows
set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Add undo break-points
set("i", ",", ",<c-g>u")
set("i", ".", ".<c-g>u")
set("i", ";", ";<c-g>u")

-- Better indenting
set("v", "<", "<gv")
set("v", ">", ">gv")

-- Commenting
-- set("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
-- set("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- NOTE: set root directory after LSP config
-- https://www.reddit.com/r/neovim/comments/16grktb/what_are_some_better_ways_to_find_the_root/
