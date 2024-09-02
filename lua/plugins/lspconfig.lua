return {
    "neovim/nvim-lspconfig",
    opts = {
        inlay_hints = { enabled = false },
        diagnostics = {
            float = {
                border = "rounded",
            },
        },
        servers = {
            -- eslint = {
            --     settings = {
            --         experimental = {
            --             useFlatConfig = true,
            --         },
            --     },
            -- },
            -- emmet_language_server = {},
        },
    },
    keys = function()
        local keys = require("lazyvim.plugins.lsp.keymaps").get()
        keys[#keys + 1] = { "<leader>cl", false }
        keys[#keys + 1] = { "<leader>cr", false }
        keys[#keys + 1] = { "<leader>cR", false }
        keys[#keys + 1] = { "<leader>cd", false }
        keys[#keys + 1] = { "gt", vim.lsp.buf.type_definition, desc = "Type Definition" }
        keys[#keys + 1] = { "<leader>rn", vim.lsp.buf.rename, desc = "Rename", has = "rename" }
        keys[#keys + 1] = {
            "<leader>rf",
            LazyVim.lsp.rename_file,
            desc = "Rename File",
            mode = { "n" },
            has = { "workspace/didRenameFiles", "workspace/willRenameFiles" },
        }
        keys[#keys + 1] = { "<leader>cl", false }
    end,
}
