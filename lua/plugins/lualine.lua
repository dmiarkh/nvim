return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    init = function()
        vim.g.lualine_laststatus = vim.o.laststatus
        if vim.fn.argc(-1) > 0 then
            -- set an empty statusline till lualine loads
            vim.o.statusline = " "
        else
            -- hide the statusline on the starter page
            vim.o.laststatus = 0
        end
    end,
    opts = function()
        vim.o.laststatus = vim.g.lualine_laststatus

        local opts = {
            options = {
                theme = "catppuccin",
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
                            added = " ",
                            modified = " ",
                            removed = " ",
                        },
                    },
                },
                lualine_c = {
                    -- LazyVim.lualine.root_dir(),
                    { "filetype", icon_only = true, separator = "", padding = { left = 2, right = 0 } },
                    { "filename", path = 1, padding = { left = -1 } },
                },
                lualine_x = {
                    -- stylua: ignore
                    {
                        function() return require("noice").api.status.command.get() end,
                        cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
                        color = { fg = "#cba6f8" }
                    },
                    -- stylua: ignore
                    {
                        function() return require("noice").api.status.mode.get() end,
                        cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
                        color = { fg = "#fab388" }
                    },
                    -- stylua: ignore
                    -- {
                    --     function() return "  " .. require("dap").status() end,
                    --     cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
                    --     color = function() return LazyVim.ui.fg("Debug") end,
                    --     get color by running :lua print(string.format("#%06x", vim.api.nvim_get_hl(0, {name = "Debug"}).fg))
                    -- },
                    {
                        require("lazy.status").updates,
                        cond = require("lazy.status").has_updates,
                        color = { fg = "#f5c2e8" },
                    },
                    {
                        "diagnostics",
                        symbols = {
                            error = " ",
                            warn = " ",
                            info = " ",
                            hint = " ",
                        },
                    },
                },
                lualine_y = {
                    { "filetype", separator = "" },
                },
                lualine_z = {
                    function()
                        return string.format(" %d:%d / %d ", vim.fn.line("."), vim.fn.col("."), vim.fn.line("$"))
                    end,
                },
            },
            extensions = { "nvim-tree", "oil", "lazy" },
        }

        return opts
    end,
}
