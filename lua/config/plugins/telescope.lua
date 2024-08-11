return {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function()
                return vim.fn.executable("make") == 1
            end,
        },
        "nvim-tree/nvim-web-devicons",
        "nvim-telescope/telescope-ui-select.nvim",
        "folke/todo-comments.nvim",
    },
    config = function()
        require("telescope").setup({
            defaults = {
                path_display = { "smart" },
                file_ignore_patterns = {
                    "node%_modules/.*",
                },
                sorting_strategy = "ascending",
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                    },
                },
            },
        })

        local open_with_trouble = require("trouble.sources.telescope").open
        local telescope = require("telescope")

        telescope.setup({
            defaults = {
                mappings = {
                    i = { ["<c-t>"] = open_with_trouble },
                    n = { ["<c-t>"] = open_with_trouble },
                },
            },
        })

        require("telescope").load_extension("fzf")
        require("telescope").load_extension("ui-select")

        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
        vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = "Find Recent" })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find Grep" })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help" })
        vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Find Word" })
        vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "Find Resume" })
        vim.keymap.set("n", "<leader>fi", builtin.git_files, { desc = "Find files (git)" })
        vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Find Diagnostics" })
        vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find Keymaps" })
        vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find Todos" })
        vim.keymap.set("n", "<leader>f:", "<cmd>Telescope command_history<cr>", { desc = "Find Command History" })
        vim.keymap.set("n", '<leader>f"', "<cmd>Telescope registers<cr>", { desc = "Find Registers" })
        vim.keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "Git Commits" })
        vim.keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", { desc = "Git Branches" })
        vim.keymap.set(
            "n",
            "<leader>fb",
            "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
            { desc = "Find Buffers" }
        )
        vim.keymap.set("n", "<leader>fn", function()
            builtin.find_files({ cwd = vim.fn.stdpath("config") })
        end, { desc = "Find neovim files" })
        vim.keymap.set("n", "<leader>fo", function()
            builtin.find_files({ cwd = "~/Notes/" })
        end, { desc = "Find notes" })
    end,
}
