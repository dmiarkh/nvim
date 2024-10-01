return {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    event = "VeryLazy",
    build = ":UpdateRemotePlugins",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-telescope/telescope.nvim", -- optional
        "neovim/nvim-lspconfig", -- optional
    },
    opts = function()
        vim.keymap.set("n", "<leader>u;", "<cmd>TailwindConcealToggle<cr>", { desc = "Toggle Tailwind conceal" })
    end,
}
