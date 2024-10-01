return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    event = "VeryLazy",
    opts = {
        menu = {
            width = vim.api.nvim_win_get_width(0) - 4,
        },
        settings = {
            save_on_toggle = true,
        },
    },
    keys = function()
        local harpoon = require("harpoon")
        local keys = {
            {
                "<leader>ha",
                function()
                    require("harpoon"):list():add()
                end,
                desc = "Harpoon Add",
            },
            {
                "<leader>hl",
                function()
                    harpoon.ui:toggle_quick_menu(harpoon:list())
                end,
                desc = "Harpoon List",
            },
            {
                "<A-f>",
                function()
                    harpoon:list():select(1)
                end,
            },
            {
                "<A-d>",
                function()
                    harpoon:list():select(2)
                end,
            },
            {
                "<A-s>",
                function()
                    harpoon:list():select(3)
                end,
            },
            {
                "<A-a>",
                function()
                    harpoon:list():select(4)
                end,
            },
        }

        return keys
    end,
}
