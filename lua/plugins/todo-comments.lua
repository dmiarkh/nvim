return {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = "LazyFile",
    opts = {},
    -- stylua: ignore
    keys = {
        { "]t", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
        { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
        { "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "Todo (Trouble)" },
        { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find Todos", },
    },
}