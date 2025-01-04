return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "mocha",
            transparent_background = true,
            integrations = {
                cmp = true,
                dashboard = true,
                gitsigns = true,
                harpoon = true,
                indent_blankline = { enabled = true },
                lsp_trouble = true,
                markdown = true,
                mason = true,
                mini = true,
                native_lsp = {
                    enabled = true,
                    underlines = {
                        errors = { "undercurl" },
                        hints = { "undercurl" },
                        warnings = { "undercurl" },
                        information = { "undercurl" },
                    },
                },
                nvimtree = true,
                noice = true,
                ufo = true,
                semantic_tokens = true,
                telescope = true,
                treesitter = true,
                treesitter_context = true,
                which_key = true,
            },
        })
        vim.cmd.colorscheme("catppuccin")
    end,
}
