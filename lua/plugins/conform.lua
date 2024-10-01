return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    cmd = "ConformInfo",
    opts = function()
        vim.keymap.set({ "n", "v" }, "<leader>cf", function()
            -- FIX: doesn't work
            require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
        end, { desc = "Format file or range" })
        return {
            default_format_opts = {
                timeout_ms = 3000,
                async = false,
                quiet = false,
                lsp_format = "fallback",
            },
            formatters_by_ft = {
                lua = { "stylua" },
                sh = { "shfmt" },
                javascript = { "prettierd", "prettier", stop_after_first = true },
                typescript = { "prettierd", "prettier", stop_after_first = true },
                javascriptreact = { "prettierd", "prettier", stop_after_first = true },
                typescriptreact = { "prettierd", "prettier", stop_after_first = true },
                css = { "prettierd", "prettier", stop_after_first = true },
                html = { "prettierd", "prettier", stop_after_first = true },
                json = { "prettierd", "prettier", stop_after_first = true },
                yaml = { "prettierd", "prettier", stop_after_first = true },
                markdown = { "prettierd", "prettier", stop_after_first = true },
                graphql = { "prettierd", "prettier", stop_after_first = true },
                python = { "isort", "black", stop_after_first = true },
            },
            format_on_save = {
                lsp_format = "fallback",
            },
        }
    end,
}
