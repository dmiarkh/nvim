return {
    "stevearc/oil.nvim",
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    opts = {
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
    },
    keys = {
        { "-", "<cmd>Oil --float<cr>", desc = "Open Oil" },
    },
}
