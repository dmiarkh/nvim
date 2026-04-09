vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.scrolloff = 13
vim.o.sidescrolloff = 13
vim.o.completeopt = "menu,menuone,noinsert"
vim.o.showmode = false
vim.o.cursorline = true
vim.o.shiftwidth = 4 -- Size of an indent
vim.o.tabstop = 4 -- Number of spaces tabs count for
vim.o.softtabstop = 4
-- vim.o.shiftround = true
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.timeoutlen = 400
vim.o.ttimeoutlen = 10
vim.o.synmaxcol = 512
vim.o.conceallevel = 1
vim.o.confirm = true
-- vim.o.formatoptions = "jcroqlnt"
-- vim.o.jumpoptions = "view"
vim.o.laststatus = 3 -- global statusline
vim.o.linebreak = true -- wrap lines at convenient points
vim.o.breakindent = true
vim.o.list = true
vim.o.pumheight = 10
vim.opt.shortmess:append({ I = true })
vim.o.smartindent = true
-- vim.opt.spelloptions:append("noplainbuffer")
vim.o.splitkeep = "screen"
vim.o.undofile = true
vim.o.updatetime = 1000
vim.o.virtualedit = "block"
-- vim.o.wildmode = "longest:full,full" -- Command-line completion mode
vim.o.smoothscroll = true
vim.o.mouse = "a"
vim.o.wrap = false
vim.o.grepprg = "rg --vimgrep"
vim.o.grepformat = "%f:%l:%c:%m"

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.inccommand = "split"

-- Splits
vim.o.splitright = true
vim.o.splitbelow = true

-- Disable healthcheck
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

-- Folding.
vim.o.foldcolumn = "1"
vim.o.foldlevelstart = 99
-- vim.o.foldmethod = "expr"
