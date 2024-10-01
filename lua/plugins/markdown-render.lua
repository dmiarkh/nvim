return {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = "markdown",
    config = function()
        vim.keymap.set("n", "<leader>um", function()
            require("render-markdown").toggle()
        end, { desc = "Toggle markdown view" })
    end,
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },
}
