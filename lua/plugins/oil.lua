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
            delete_to_trash = true,
            float = {
                -- Padding around the floating window
                padding = 4,
                max_width = 160,
                max_height = 0,
                border = "rounded",
                win_options = {
                    winblend = 0,
                },
            },
        })

        vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open Oil" })
    end,
}
