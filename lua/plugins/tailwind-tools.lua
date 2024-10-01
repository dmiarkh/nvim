return {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    ft = { "javascriptreact", "typescriptreact", "javascript", "typescript", "css" },
    build = ":UpdateRemotePlugins",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    opts = function()
        vim.keymap.set("n", "<leader>u;", "<cmd>TailwindConcealToggle<cr>", { desc = "Toggle Tailwind conceal" })
    end,
}
