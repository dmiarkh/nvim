return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("gitsigns").setup({
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "-" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
            current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, desc)
                    vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
                end

                -- Navigation
                map("n", "ghn", gs.next_hunk, "Next Hunk")
                map("n", "ghp", gs.prev_hunk, "Prev Hunk")

                -- Actions
                map("n", "<leader>ghs", gs.stage_hunk, "Stage hunk")
                map("n", "<leader>ghr", gs.reset_hunk, "Reset hunk")
                map("v", "<leader>ghs", function()
                    gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end, "Stage hunk")
                map("v", "<leader>ghr", function()
                    gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end, "Reset hunk")

                map("n", "<leader>gs", gs.stage_buffer, "Stage buffer")
                map("n", "<leader>gr", gs.reset_buffer, "Reset buffer")

                map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo stage hunk")

                map("n", "<leader>ghv", gs.preview_hunk, "Preview hunk")

                map("n", "<leader>ghB", function()
                    gs.blame_line({ full = true })
                end, "Git blame (full)")
                map("n", "<leader>ghb", "<cmd>lua require('gitsigns').blame_line()<cr>", "Git blame")

                map("n", "<leader>ghd", gs.diffthis, "Diff this")
                map("n", "<leader>ghD", function()
                    gs.diffthis("~1")
                end, "Diff this vs last commit")

                -- Text object
                map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
            end,
        })
    end,
}
