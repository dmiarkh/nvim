return {
    "folke/zen-mode.nvim",
    opts = {
        window = {
            options = {
                foldcolumn = "0",
            },
        },
    },
    keys = {
        { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen mode" },
    },
}
