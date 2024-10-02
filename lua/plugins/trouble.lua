return {
    "folke/trouble.nvim",
    cmd = { "Trouble" },
    opts = {},
    -- BUG: some buffers open without number and sign columns
    keys = {
        { "<leader>xd", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
        { "<leader>xw", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
        { "<leader>xD", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
        { "<leader>xl", "<cmd>Trouble telescope toggle<cr>", desc = "Telescope (Trouble)" },
        { "<leader>xt", "<cmd>Trouble todo<cr>", desc = "Todos (Trouble)" },
        { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
        { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
        {
            "[q",
            function()
                if require("trouble").is_open() then
                    require("trouble").prev({ skip_groups = true, jump = true })
                else
                    local ok, err = pcall(vim.cmd.cprev)
                    if not ok then
                        vim.notify(err, vim.log.levels.ERROR)
                    end
                end
            end,
            desc = "Previous Trouble/Quickfix Item",
        },
        {
            "]q",
            function()
                if require("trouble").is_open() then
                    require("trouble").next({ skip_groups = true, jump = true })
                else
                    local ok, err = pcall(vim.cmd.cnext)
                    if not ok then
                        vim.notify(err, vim.log.levels.ERROR)
                    end
                end
            end,
            desc = "Next Trouble/Quickfix Item",
        },
    },
}
