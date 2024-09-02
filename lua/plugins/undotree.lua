return {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    event = "VeryLazy",
    config = true,
    keys = {
        { "<leader>uu", "<cmd>lua require('undotree').toggle()<cr>", desc = "Undo tree" },
    },
}
