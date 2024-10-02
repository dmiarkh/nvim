return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "modern",
        delay = 1000,
        spec = {
            { "<leader>f", group = "Find" },
            { "<leader>e", group = "File Explorer" },
            {
                "<leader>s",
                group = "Split",
                icon = { icon = "", color = "green" },
            },
            { "<leader>u", group = "UI", icon = { icon = "󰙵 ", color = "cyan" } },
            { "<leader>p", group = "Session" },
            { "<leader>q", group = "Quickfix" },
            { "<leader>c", group = "Code" },
            { "<leader>U", desc = "Undo tree", icon = { icon = "", color = "red" } },
            { "<leader>g", group = "Git" },
            { "<leader>h", group = "Harpoon", icon = { icon = "⇁", color = "yellow" } },
            -- TODO: check lazyvim icons
            { "<leader>x", group = "Trouble", icon = { icon = "", color = "orange" } },
            { "<leader>r", desc = "Rename", icon = { icon = "", color = "azure" } },
            { "<leader>d", group = "Document", icon = { icon = "", color = "green" } },
            { "<leader>w", group = "Workspace", icon = { icon = "", color = "azure" } },
        },
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Which-key keymaps",
        },
    },
}
