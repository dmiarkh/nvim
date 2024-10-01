return {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = "markdown",
    config = true,
    keys = {
        {
            "<leader>um",
            function()
                require("render-markdown").toggle()
            end,
            desc = "Toggle markdown view",
        },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },
}
