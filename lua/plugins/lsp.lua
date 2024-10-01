return {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
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
        "williamboman/mason-lspconfig.nvim",
        -- NOTE: see if this is needed (look for rename logs in :messages)
        -- { "antosha417/nvim-lsp-file-operations", opts = {} },
    },
    config = function()
        local lspconfig = require("lspconfig")

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local opts = { buffer = ev.buf, silent = true }
                local builtin = require("telescope.builtin")

                opts.desc = "Show LSP references"
                vim.keymap.set("n", "gr", builtin.lsp_references, opts)

                opts.desc = "Show LSP definitions"
                vim.keymap.set("n", "gd", builtin.lsp_definitions, opts)

                opts.desc = "Go to declaration"
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

                opts.desc = "Show document symbols"
                vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, opts)

                opts.desc = "Show workspace symbols"
                vim.keymap.set("n", "<leader>ws", builtin.lsp_workspace_symbols, opts)

                opts.desc = "Show LSP implementations"
                vim.keymap.set("n", "gi", builtin.lsp_implementations, opts)

                opts.desc = "Show LSP type definitions"
                vim.keymap.set("n", "gt", builtin.lsp_type_definitions, opts)

                opts.desc = "See available code actions"
                vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

                opts.desc = "Rename"
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

                opts.desc = "Show line diagnostics"
                vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

                opts.desc = "Show buffer diagnostics"
                vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

                opts.desc = "Go to previous diagnostic"
                vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

                opts.desc = "Go to next diagnostic"
                vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

                opts.desc = "Signature help"
                vim.keymap.set("i", "<c-k>", vim.lsp.buf.signature_help, opts)

                -- TODO: remove the no information found message (in ts files)
                opts.desc = "Show documentation for what is under cursor"
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

                -- TODO: setup vstls for inlay hints and check if this works
                opts.desc = "Toggle inlay hints"
                vim.keymap.set("n", "<leader>uh", function()
                    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = ev.buf }))
                end, opts)
            end,
        })

        local icons = {
            ERROR = " ",
            WARN = " ",
            HINT = " ",
            INFO = " ",
        }

        vim.diagnostic.config({
            underline = true,
            update_in_insert = false,
            virtual_text = {
                spacing = 4,
                source = "if_many",
                prefix = function(diagnostic)
                    return icons[vim.diagnostic.severity[diagnostic.severity]] or "●"
                end,
            },
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = icons.ERROR,
                    [vim.diagnostic.severity.WARN] = icons.WARN,
                    [vim.diagnostic.severity.HINT] = icons.HINT,
                    [vim.diagnostic.severity.INFO] = icons.INFO,
                },
            },
            severity_sort = true,
            float = {
                border = "rounded",
            },
            inlay_hints = {
                enabled = true,
            },
            codelens = {
                enabled = true,
            },
            capabilities = {
                workspace = {
                    fileOperations = {
                        didRename = true,
                        willRename = true,
                    },
                },
            },
            format = {
                formatting_options = nil,
                timeout_ms = nil,
            },
        })

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
        -- local capabilities = require("cmp_nvim_lsp").default_capabilities()

        require("mason-lspconfig").setup_handlers({
            -- NOTE: organize imports fot ts
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = capabilities,
                })
            end,
            ["emmet_ls"] = function()
                lspconfig["emmet_ls"].setup({
                    -- TODO: do something with the noise
                    capabilities = capabilities,
                    filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
                })
            end,
            ["lua_ls"] = function()
                lspconfig["lua_ls"].setup({
                    capabilities = capabilities,
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                            },
                        },
                    },
                })
            end,
        })
    end,
}
