return {
    "saghen/blink.cmp",
    event = "InsertEnter",
    dependencies = {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
    version = "*",

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = { preset = "default", ["<C-c>"] = { "cancel", "fallback" } },
        enabled = function()
            return not vim.tbl_contains({ "markdown" }, vim.bo.filetype)
                and vim.bo.buftype ~= "prompt"
                and vim.b.completion ~= false
        end,
        completion = {
            keyword = {
                range = "full",
            },
            menu = {
                border = "single",
                auto_show = function(ctx)
                    return ctx.mode ~= "cmdline"
                end,
                draw = {
                    columns = {
                        { "label", "label_description", gap = 1 },
                        { "kind_icon", "kind" },
                    },
                },
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 500,
                window = { border = "single" },
            },
        },
        signature = { enabled = true, window = { border = "single" } },
        appearance = {
            nerd_font_variant = "mono",
        },
        snippets = { preset = "luasnip" },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },
    },
    opts_extend = { "sources.default" },
}
