return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "modern",
        delay = 600,
        spec = {
            { "<leader>f", group = "Find" },
            { "<leader>e", group = "File Explorer" },
            {
                "<leader>s",
                group = "Split",
                icon = { icon = "", color = "green" },
            },
            { "<leader>c", group = "Code" },
            { "<leader>u", desc = "Undo tree", icon = { icon = "", color = "red" } },
            { "<leader>-", desc = "Close Oil", icon = { icon = "", color = "red" } },
            { "<leader>g", group = "Git" },
            { "<leader>gh", group = "Hunk" },
            { "<leader>h", group = "Harpoon", icon = { icon = "⇁", color = "yellow" } },
            { "<leader>p", group = "Previous", icon = "" },
            { "<leader>n", group = "Next", icon = "" },
            { "<leader>q", group = "Quickfix", icon = { icon = "", color = "cyan" } },
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
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
}
