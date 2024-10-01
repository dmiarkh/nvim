return {
    "nvim-tree/nvim-tree.lua",
    event = "VeryLazy",
    keys = {
        { "<leader>eo", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file explorer" },
        { "<leader>ef", "<cmd>NvimTreeFindFileToggle<cr>", desc = "Toggle file explorer on current file" },
        { "<leader>ec", "<cmd>NvimTreeCollapse<cr>", desc = "Collapse file explorer" },
        { "<leader>er", "<cmd>NvimTreeRefresh<cr>", desc = "Refresh file explorer" },
    },
    opts = {
        view = {
            width = 35,
            relativenumber = true,
        },
        renderer = {
            indent_markers = {
                enable = true,
            },
        },
        -- disable window_picker for
        -- explorer to work well with
        -- window splits
        actions = {
            open_file = {
                window_picker = {
                    enable = false,
                },
            },
        },
        git = {
            ignore = false,
        },
    },
}
