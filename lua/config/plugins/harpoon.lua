return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")

        -- REQUIRED
        harpoon:setup({
            settings = {
                save_on_toggle = true,
            },
        })
        -- REQUIRED

        vim.keymap.set("n", "<leader>ha", function()
            harpoon:list():add()
        end, { desc = "Add harpoon" })
        vim.keymap.set("n", "<leader>hl", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = "Open harpoon list" })

        vim.keymap.set("n", "<A-f>", function()
            harpoon:list():select(1)
        end)
        vim.keymap.set("n", "<A-d>", function()
            harpoon:list():select(2)
        end)
        vim.keymap.set("n", "<A-s>", function()
            harpoon:list():select(3)
        end)
        vim.keymap.set("n", "<A-a>", function()
            harpoon:list():select(4)
        end)
    end,
}
