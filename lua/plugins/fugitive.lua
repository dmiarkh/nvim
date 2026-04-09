vim.pack.add({ "https://github.com/tpope/vim-fugitive" })

vim.keymap.set("n", "<leader>G", "<cmd>Git<cr>", { desc = "Fugitive" })
