vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.termguicolors = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.scrolloff = 14
vim.opt.cursorline = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"
vim.opt.clipboard:append("unnamedplus")
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.undofile = true
-- vim.opt.wrap = false

-- Tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "split"

-- vim.opt.backspace = "indent,eol,start"

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Folds
vim.o.foldenable = true
vim.o.foldcolumn = "1"
vim.o.foldlevelstart = 99
vim.o.foldlevel = 99
vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Required by obsidian
vim.opt.conceallevel = 1
