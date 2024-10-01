return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        {
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            build = "make install_jsregexp",
        },
        -- NOTE: check these
        "saadparwaiz1/cmp_luasnip", -- for autocompletion
        "rafamadriz/friendly-snippets", -- useful snippets
        -- NOTE: see if I can replace lspkind with my own icons
        "onsails/lspkind.nvim", -- vs-code like pictograms
    },
    opts = function()
        local cmp = require("cmp")

        require("luasnip.loaders.from_vscode").lazy_load()

        return {
            completion = {
                completeopt = "menu,menuone,preview,noinsert",
            },
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                ["<C-d>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<C-y>"] = cmp.mapping.confirm({ select = false }),
            }),

            sources = cmp.config.sources({
                { name = "nvim_lsp"},
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
            }),

            ---@diagnostic disable-next-line: missing-fields
            formatting = {
                format = require('lspkind').cmp_format({
                    maxwidth = 50,
                    ellipsis_char = "...",
                }),
            },
        }
    end,
}
