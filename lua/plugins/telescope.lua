return {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    branch = "0.1.x",
    -- TODO: set cwd like in lazyvim
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
        },
        "nvim-telescope/telescope-ui-select.nvim",
    },
    keys = {
        -- stylua: ignore start
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files", },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Find Grep", },
        { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find Help", },
        { "<leader>fr", "<cmd>Telescope resume<cr>", desc = "Find Resume", },
        { "<leader>f.", "<cmd>Telescope oldfiles<cr>", desc = "Find Recent", },
        { "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "Find Word", },
        { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Find Diagnostics", },
        { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Find Keymaps", },
        { "<leader>fi", "<cmd>Telescope git_files<cr>", desc = "Find Files (git)", },
        { "<leader>f:", "<cmd>Telescope command_history<cr>", desc = "Find Command history", },
        { '<leader>f"', "<cmd>Telescope registers<cr>", desc = "Find Registers", },
        { "<leader>fb", "<cmd>Telescope buffers sort_mru=true initial_mode=normal sort_lastused=true<cr>", desc = "Find Buffers", },
        { "<leader>fc", function() require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Neovim Files", },
        { "<leader>fo", function() require("telescope.builtin").find_files({ cwd = "~/Notes/" }) end, desc = "Find Notes", },
        -- stylua: ignore end
    },
    opts = function()
        local builtin = require("telescope.builtin")

        local open_with_trouble = function(...)
            return require("trouble.sources.telescope").open(...)
        end

        local find_all = function()
            builtin.find_files({ hidden = true, no_ignore = true })
        end

        require("telescope").load_extension("fzf")
        require("telescope").load_extension("ui-select")
        return {
            defaults = {
                prompt_prefix = " ",
                selection_caret = " ",
                layout_strategy = "horizontal",
                layout_config = { prompt_position = "top" },
                sorting_strategy = "ascending",
                dynamic_preview_title = true,
                file_ignore_patterns = {
                    "node%_modules/.*",
                },
                mappings = {
                    i = {
                        ["<c-t>"] = open_with_trouble,
                        ["<c-h>"] = find_all,
                        -- TODO: C-r for searching in root directory?
                    },
                    n = {
                        ["<c-t>"] = open_with_trouble,
                        ["x"] = require("telescope.actions").delete_buffer,
                    },
                },
                find_files = {
                    pickers = {
                        find_command = { "rg", "--files", "--color", "never", "-g", "!.git" },
                    },
                },
            },
        }
    end,
}
