return {
    {
        "nvim-telescope/telescope.nvim",
        opts = {
            defaults = {
                layout_strategy = "horizontal",
                layout_config = { prompt_position = "top" },
                sorting_strategy = "ascending",
                winblend = 0,
                file_ignore_patterns = {
                    "node%_modules/.*",
                },
            },
        },
        keys = function()
            return {
                {
                    "<leader>ff",
                    function()
                        local builtin = require("telescope.builtin")
                        builtin.find_files({
                            no_ignore = true,
                            hidden = true,
                        })
                    end,
                    desc = "Find File",
                },
                {
                    "<leader>fg",
                    "<cmd>Telescope live_grep<cr>",
                    desc = "Find Grep",
                },
                {
                    "<leader>fh",
                    "<cmd>Telescope help_tags<cr>",
                    desc = "Find Help",
                },
                {
                    "<leader>fr",
                    "<cmd>Telescope resume<cr>",
                    desc = "Find Resume",
                },
                {
                    "<leader>f.",
                    "<cmd>Telescope oldfiles<cr>",
                    desc = "Find Recent",
                },
                {
                    "<leader>fw",
                    "<cmd>Telescope grep_string<cr>",
                    desc = "Find Word",
                },
                {
                    "<leader>fd",
                    "<cmd>Telescope diagnostics<cr>",
                    desc = "Find Diagnostics",
                },
                {
                    "<leader>fk",
                    "<cmd>Telescope keymaps<cr>",
                    desc = "Find Keymaps",
                },
                {
                    "<leader>fi",
                    "<cmd>Telescope git_files<cr>",
                    desc = "Find Files (git)",
                },
                {
                    "<leader>f:",
                    "<cmd>Telescope command_history<cr>",
                    desc = "Find Command history",
                },
                {
                    '<leader>f"',
                    "<cmd>Telescope registers<cr>",
                    desc = "Find Registers",
                },
                {
                    "<leader>fb",
                    "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
                    desc = "Find Buffers",
                },
                {
                    "<leader>fn",
                    function()
                        require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
                    end,
                    desc = "Find Neovim Files",
                },
                {
                    "<leader>fo",
                    function()
                        require("telescope.builtin").find_files({ cwd = "~/Notes/" })
                    end,
                    desc = "Find Notes",
                },
            }
        end,
    },
}
