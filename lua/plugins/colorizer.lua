return {
    "norcalli/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("colorizer").setup({
            "*",
        }, {
            css = true,
            RRGGBBAA = true,
            rgb_fn = true,
            hsl_fn = true,
            css_fn = true,
        })
    end,
}
