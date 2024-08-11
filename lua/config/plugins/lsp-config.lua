return {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        { "hrsh7th/cmp-nvim-lsp" },
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    opts = {
        inlay_hints = { enabled = true },
    },
    config = function()
        local lspconfig = require("lspconfig")

        lspconfig.util.default_config.capabilities = vim.tbl_deep_extend(
            "force",
            lspconfig.util.default_config.capabilities,
            require("cmp_nvim_lsp").default_capabilities()
        )

        vim.api.nvim_create_autocmd("LspAttach", {
            desc = "LSP actions",
            callback = function(event)
                local opts = { buffer = event.buf }
                local builtin = require("telescope.builtin")

                opts.desc = "Hover documentation"
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

                opts.desc = "Go to references"
                vim.keymap.set("n", "gr", builtin.lsp_references, opts)

                opts.desc = "Go to declaration"
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

                opts.desc = "Go to definition"
                vim.keymap.set("n", "gd", builtin.lsp_definitions, opts) -- show lsp definitions

                opts.desc = "Show implementations"
                vim.keymap.set("n", "gi", builtin.lsp_implementations, opts) -- show lsp implementations

                opts.desc = "Show type definitions"
                vim.keymap.set("n", "gt", builtin.lsp_type_definitions, opts) -- show lsp type definitions

                opts.desc = "Code actions"
                vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

                opts.desc = "Rename"
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

                opts.desc = "Show buffer diagnostics"
                vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

                opts.desc = "Show line diagnostics"
                vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

                opts.desc = "Go to previous diagnostic"
                vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

                opts.desc = "Go to next diagnostic"
                vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

                opts.desc = "Document symbols"
                vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, opts) -- show lsp type definitions

                opts.desc = "Workspace symbols"
                vim.keymap.set("n", "<leader>ws", builtin.lsp_workspace_symbols, opts) -- show lsp type definitions

                opts.desc = "Signature help"
                vim.keymap.set("i", "<C-i>", vim.lsp.buf.signature_help, opts)

                opts.desc = "Organize imports"
                vim.keymap.set("n", "<leader>di", "<cmd>OrganizeImports<cr>", opts)
            end,
        })

        -- Change the Diagnostic symbols in the sign column (gutter)
        -- (not in youtube nvim video)
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        vim.diagnostic.config({
            float = {
                border = "rounded",
            },
        })
        -- 			-- The following two autocommands are used to highlight references of the
        -- 			-- word under your cursor when your cursor rests there for a little while.
        -- 			--    See `:help CursorHold` for information about when this is executed
        -- 			--
        -- 			-- When you move your cursor, the highlights will be cleared (the second autocommand).
        -- 			local client = vim.lsp.get_client_by_id(event.data.client_id)
        -- 			if client and client.server_capabilities.documentHighlightProvider then
        -- 				vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        -- 					buffer = event.buf,
        -- 					callback = vim.lsp.buf.document_highlight,
        -- 				})
        --
        -- 				vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        -- 					buffer = event.buf,
        -- 					callback = vim.lsp.buf.clear_references,
        -- 				})
        -- 			end
    end,
}
