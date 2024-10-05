return {
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        build = ":MasonUpdate",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "×",
                },
                border = "rounded",
            },
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        event = { "BufReadPost", "BufWritePost", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
        },
        opts = {
            ensure_installed = {
                "bashls",
                "cssls",
                "emmet_language_server",
                "eslint",
                "html",
                "html",
                "lua_ls",
                "prismals",
                "tailwindcss",
                "tailwindcss",
                -- "vtsls",
                -- "graphql",
            },
        },
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        event = "BufEnter",
        dependencies = {
            "williamboman/mason.nvim",
        },
        opts = {
            ensure_installed = {
                "black",
                "isort",
                "prettier",
                "prettierd",
                "pylint",
                "shfmt",
                "shellcheck",
                "stylua",
            },
        },
    },
}
