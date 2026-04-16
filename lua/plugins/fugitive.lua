vim.pack.add({ "https://github.com/tpope/vim-fugitive" })

vim.keymap.set("n", "<leader>G", "<cmd>Git<cr>", { desc = "Fugitive" })
vim.keymap.set("n", "<leader>2", "<cmd>diffget //2<cr>", { desc = "Get from HEAD" })
vim.keymap.set("n", "<leader>3", "<cmd>diffget //3<cr>", { desc = "Get from target" })
