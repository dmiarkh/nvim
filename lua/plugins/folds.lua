return {
    "kevinhwang91/nvim-ufo",
    dependencies = {
        "kevinhwang91/promise-async",
        {
            "luukvbaal/statuscol.nvim",
            opts = function()
                local builtin = require("statuscol.builtin")
                return {
                    segments = {
                        { text = { "%s" }, click = "v:lua.scsa" },
                        { text = { builtin.lnumfunc }, click = "v:lua.scla" },
                        {
                            text = { " ", builtin.foldfunc, " " },
                            condition = { builtin.not_empty, true, builtin.not_empty },
                            click = "v:lua.scfa",
                        },
                    },
                }
            end,
        },
    },

    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    opts = function()
        local handler = function(virtText, lnum, endLnum, width, truncate)
            local newVirtText = {}
            local suffix = (" 󰁂 %d "):format(endLnum - lnum)
            local sufWidth = vim.fn.strdisplaywidth(suffix)
            local targetWidth = width - sufWidth
            local curWidth = 0
            for _, chunk in ipairs(virtText) do
                local chunkText = chunk[1]
                local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                if targetWidth > curWidth + chunkWidth then
                    table.insert(newVirtText, chunk)
                else
                    chunkText = truncate(chunkText, targetWidth - curWidth)
                    local hlGroup = chunk[2]
                    table.insert(newVirtText, { chunkText, hlGroup })
                    chunkWidth = vim.fn.strdisplaywidth(chunkText)
                    -- str width returned from truncate() may less than 2nd argument, need padding
                    if curWidth + chunkWidth < targetWidth then
                        suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
                    end
                    break
                end
                curWidth = curWidth + chunkWidth
            end
            table.insert(newVirtText, { suffix, "MoreMsg" })
            return newVirtText
        end

        return {
            open_fold_hl_timeout = 100,
            provider_selector = function()
                return { "treesitter", "indent" }
            end,
            close_fold_kinds = {},
            enable_get_fold_virt_text = false,
            fold_virt_text_handler = handler,
            preview = {},
            close_fold_kinds_for_ft = {
                default = { default = {} },
            },
        }
    end,
}
