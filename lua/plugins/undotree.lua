return {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    event = "VeryLazy",
    config = true,
    keys = {
        { "<leader>U", "<cmd>lua require('undotree').toggle()<cr>", desc = "Undo tree" },
    },
}
