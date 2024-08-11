return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
        require("oil").setup({
            default_file_explorer = false,
            view_options = {
                show_hidden = true,
            },
        })

        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open Oil" })
        vim.keymap.set("n", "<leader>-", require("oil").close, { desc = "Close Oil" })
    end,
}
