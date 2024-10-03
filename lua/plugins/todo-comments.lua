return {
    "folke/todo-comments.nvim",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    cmd = { "TodoTrouble", "TodoTelescope" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
        -- stylua: ignore start
        { "]t", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment", },
        { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment", },
        { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find todo" },
        -- stylua: ignore end
    },
}
