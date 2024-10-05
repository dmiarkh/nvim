return {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = function()
        vim.keymap.set("n", "<leader>co", "<cmd>TSToolsOrganizeImports<cr>", { desc = "Ortanize ts imports" })
        vim.keymap.set("n", "<leader>ci", "<cmd>TSToolsAddMissingImports<cr>", { desc = "Add missing ts imports" })
    end,
}
