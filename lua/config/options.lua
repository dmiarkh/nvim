-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Options for the LazyVim statuscolumn
vim.g.lazyvim_statuscolumn = {
    folds_open = false, -- show fold sign when fold is open
    folds_githl = false, -- highlight fold sign with git sign color
    -- TODO: highlight when opens
}

local opt = vim.opt

opt.scrolloff = 13 -- Lines of context
opt.shiftwidth = 4 -- Size of an indent
opt.tabstop = 4 -- Number of spaces tabs count for
opt.softtabstop = 4
opt.autoindent = true
opt.timeoutlen = 400
opt.synmaxcol = 512
opt.completeopt = "menu,menuone,noinsert"
-- Popup transparancy
opt.pumblend = 0

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
