return {
    "williamboman/mason.nvim",
    lazy = false,
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        {
            "j-hui/fidget.nvim",
            opts = {
                -- Notification setting required by catppuccin theme
                notification = {
                    window = {
                        winblend = 0,
                    },
                },
                integration = {
                    ["nvim-tree"] = {
                        enable = true,
                    },
                },
            },
        },
    },
    config = function()
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
                border = "rounded",
            },
        })

        require("mason-lspconfig").setup({
            ensure_installed = {
                "bashls",
                "cssls",
                -- "emmet_ls",
                "emmet_language_server",
                "html",
                "lua_ls",
                "prismals",
                "tailwindcss",
                "vtsls",
                -- "graphql",
                -- "tsserver",
            },
            handlers = {
                -- this first function is the "default handler"
                -- it applies to every language server without a "custom handler"
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        handlers = {
                            ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
                                border = "rounded",
                            }),
                        },
                    })
                end,

                ["vtsls"] = function()
                    require("lspconfig")["vtsls"].setup({
                        handlers = {
                            ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
                                border = "rounded",
                            }),
                        },
                        commands = {
                            OrganizeImports = {
                                function()
                                    local params = {
                                        command = "typescript.organizeImports",
                                        arguments = { vim.api.nvim_buf_get_name(0) },
                                        title = "",
                                    }
                                    vim.lsp.buf.execute_command(params)
                                end,
                                description = "Organize imports",
                            },
                        },
                    })
                end,
                ["emmet_language_server"] = function()
                    require("lspconfig")["emmet_language_server"].setup({
                        filetypes = {
                            "html",
                            "typescriptreact",
                            "javascriptreact",
                            "css",
                            "sass",
                            "scss",
                            "less",
                        },
                    })
                end,
            },
        })

        require("mason-tool-installer").setup({
            ensure_installed = {
                "prettierd",
                "stylua",
                "eslint_d",
                "isort",
                "black",
                "pylint",
            },
        })
    end,
}
