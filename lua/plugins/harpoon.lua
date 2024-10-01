return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        settings = {
            save_on_toggle = true,
        },
    },
    keys = {
        {
            "<leader>ha",
            function()
                require("harpoon"):list():add()
            end,
            desc = "Add harpoon",
        },
        {
            "<leader>hl",
            function()
                local harpoon = require("harpoon")
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end,
            desc = "Open harpoon list",
        },
        {
            "<a-f>",
            function()
                require("harpoon"):list():select(1)
            end,
        },
        {
            "<a-d>",
            function()
                require("harpoon"):list():select(2)
            end,
        },
        {
            "<a-s>",
            function()
                require("harpoon"):list():select(3)
            end,
        },
        {
            "<a-a>",
            function()
                require("harpoon"):list():select(4)
            end,
        },
    },
}
