-- TODO: replace with vim.o
vim.o.termguicolors = true
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
vim.o.shiftround = true
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.timeoutlen = 400
vim.o.synmaxcol = 512
vim.o.conceallevel = 2
vim.o.confirm = true
vim.o.formatoptions = "jcroqlnt"
vim.o.grepformat = "%f:%l:%c:%m"
vim.o.grepprg = "rg --vimgrep"
vim.o.jumpoptions = "view"
vim.o.laststatus = 3 -- global statusline
vim.o.linebreak = true -- Wrap lines at convenient points
vim.o.list = true
vim.o.pumheight = 10
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
vim.o.smartindent = true
vim.opt.spelloptions:append("noplainbuffer")
vim.o.splitkeep = "screen"
vim.o.undofile = true
vim.o.undolevels = 10000
vim.o.updatetime = 200
vim.o.virtualedit = "block"
vim.o.wildmode = "longest:full,full" -- Command-line completion mode
vim.o.smoothscroll = true
vim.o.breakindent = true
vim.o.mouse = "a"
vim.o.wrap = false

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.inccommand = "split"

-- Splits
vim.o.splitright = true
vim.o.splitbelow = true

-- Folds
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldmethod = "expr"
-- default, lsp.foldexpr is used if available
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldtext = ""
vim.opt.fillchars:append({ fold = " " })
