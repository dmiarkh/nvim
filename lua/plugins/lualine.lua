return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
        local icons = LazyVim.config.icons

        vim.o.laststatus = vim.g.lualine_laststatus

        local opts = {
            options = {
                theme = "auto",
                globalstatus = vim.o.laststatus == 3,
                component_separators = { left = "|", right = "|" },
                section_separators = { left = "", right = "" },
                disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter" } },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = {
                    "branch",
                    {
                        "diff",
                        symbols = {
                            added = icons.git.added,
                            modified = icons.git.modified,
                            removed = icons.git.removed,
                        },
                        source = function()
                            local gitsigns = vim.b.gitsigns_status_dict
                            if gitsigns then
                                return {
                                    added = gitsigns.added,
                                    modified = gitsigns.changed,
                                    removed = gitsigns.removed,
                                }
                            end
                        end,
                    },
                },

                lualine_c = {
                    LazyVim.lualine.root_dir(),
                    { "filename", path = 1 },
                },
                lualine_x = {
                    -- stylua: ignore
                    {
                        function() return require("noice").api.status.command.get() end,
                        cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
                        color = function() return LazyVim.ui.fg("Statement") end,
                    },
                    -- stylua: ignore
                    {
                        function() return require("noice").api.status.mode.get() end,
                        cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
                        color = function() return LazyVim.ui.fg("Constant") end,
                    },
                    -- stylua: ignore
                    {
                        function() return "  " .. require("dap").status() end,
                        cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
                        color = function() return LazyVim.ui.fg("Debug") end,
                    },
                    -- stylua: ignore
                    {
                        require("lazy.status").updates,
                        cond = require("lazy.status").has_updates,
                        color = function() return LazyVim.ui.fg("Special") end,
                    },
                    {
                        "diagnostics",
                        symbols = {
                            error = icons.diagnostics.Error,
                            warn = icons.diagnostics.Warn,
                            info = icons.diagnostics.Info,
                            hint = icons.diagnostics.Hint,
                        },
                    },
                },
                lualine_y = {
                    -- { "progress" },
                    { "filetype", separator = "" },
                },
                lualine_z = {
                    function()
                        return string.format(" %d:%d / %d ", vim.fn.line("."), vim.fn.col("."), vim.fn.line("$"))
                    end,
                },
            },
            extensions = { "nvim-tree", "lazy" },
        }

        return opts
    end,
}
