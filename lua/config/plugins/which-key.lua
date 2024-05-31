return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	-- VimEnter event in kickstart
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	config = function()
		require("which-key").setup()

		require("which-key").register({
			["<leader>f"] = { name = "+ Find" },
			["<leader>e"] = { name = "+ Explorer" },
			["<leader>s"] = { name = "+ Split" },
			["<leader>p"] = { name = "+ Previous" },
			["<leader>n"] = { name = "+ Next" },
			["<leader>x"] = { name = "+ Trouble" },
		})
	end,
}
