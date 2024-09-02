return {
    {
        "williamboman/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
                border = "rounded",
            },
            ensure_installed = {
                "stylua",
                "shfmt",
                "prettierd",
                "eslint_d",
                "isort",
                "black",
                "pylint",
            },
        },
    },
}
