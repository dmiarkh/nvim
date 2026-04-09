vim.pack.add({
	{ src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
	"https://github.com/nvim-lua/plenary.nvim",
})

local harpoon = require("harpoon")

harpoon.setup({
	settings = {
		save_on_toggle = true,
	},
})

vim.keymap.set("n", "<leader>ha", function()
	harpoon:list():add()
end, { desc = "Add harpoon" })
vim.keymap.set("n", "<leader>hl", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Open harpoon list" })
vim.keymap.set("n", "<a-h>", function()
	harpoon:list():select(1)
end)
vim.keymap.set("n", "<a-t>", function()
	harpoon:list():select(2)
end)
vim.keymap.set("n", "<a-n>", function()
	harpoon:list():select(3)
end)
vim.keymap.set("n", "<a-s>", function()
	harpoon:list():select(4)
end)
