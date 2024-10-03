vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 13
vim.opt.sidescrolloff = 13
vim.opt.completeopt = "menu,menuone,noinsert"
-- Popup transparancy
vim.opt.pumblend = 0
vim.opt.showmode = false
vim.opt.cursorline = true
vim.opt.shiftwidth = 4 -- Size of an indent
vim.opt.tabstop = 4 -- Number of spaces tabs count for
vim.opt.softtabstop = 4
vim.opt.shiftround = true
vim.opt.autoindent = true
vim.opt.expandtab = true

vim.opt.timeoutlen = 400
vim.opt.synmaxcol = 512
vim.opt.autowrite = true
-- vim.opt.conceallevel = 2
vim.opt.confirm = true
vim.opt.formatoptions = "jcroqlnt"
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.jumpoptions = "view"
vim.opt.laststatus = 3 -- global statusline
vim.opt.linebreak = true -- Wrap lines at convenient points
vim.opt.list = true
vim.opt.pumheight = 10
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
vim.opt.smartindent = true
vim.opt.spelloptions:append("noplainbuffer")
vim.opt.splitkeep = "screen"
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.updatetime = 200
vim.opt.virtualedit = "block"
vim.opt.wildmode = "longest:full,full" -- Command-line completion mode
vim.opt.smoothscroll = true
vim.opt.clipboard:append("unnamedplus")
vim.opt.breakindent = true
vim.opt.mouse = "a"
vim.opt.wrap = false

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "split"

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Folds
vim.o.foldenable = true
vim.o.foldcolumn = "1"
vim.o.foldlevelstart = 99
vim.o.foldlevel = 99
vim.opt.signcolumn = "yes"
vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
--(from lazy) opt.fillchars = { foldopen = "", foldclose = "", fold = " ", foldsep = " ", diff = "╱", eob = " ", }

-- with autopair?
-- vim.opt.showmatch = true
