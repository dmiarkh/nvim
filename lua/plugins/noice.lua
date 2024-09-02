return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
        table.insert(opts.routes, {
            filter = {
                event = "notify",
                find = "No information available",
            },
            opts = { skip = true },
        })

        opts.presets.lsp_doc_border = true
    end,
    -- stylua: ignore
    keys = {
        { "<leader>n", "", desc = "+noice"},
        { "<leader>nl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
        { "<leader>nh", function() require("noice").cmd("history") end, desc = "Noice History" },
        { "<leader>na", function() require("noice").cmd("all") end, desc = "Noice All" },
        { "<leader>nd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
        { "<leader>nt", function() require("noice").cmd("pick") end, desc = "Noice Picker (Telescope/FzfLua)" },
        { "<c-d>", function() if not require("noice.lsp").scroll(4) then return "<c-d>" end end, silent = true, expr = true, desc = "Scroll Forward", mode = {"i", "n", "s"} },
        { "<c-u>", function() if not require("noice.lsp").scroll(-4) then return "<c-u>" end end, silent = true, expr = true, desc = "Scroll Backward", mode = {"i", "n", "s"}},
    },
}
