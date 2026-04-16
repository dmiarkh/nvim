vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_matchit = 1
vim.g.loaded_gzip = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zipPlugin = 1

vim.loader.enable()

require("options")
require("autocmd")
require("keymaps")
require("plugins.theme")
require("plugins.snacks")
require("plugins.mini")
require("plugins.treesitter")
require("plugins.lsp")
require("plugins.lualine")
require("plugins.gitsigns")
require("plugins.completion")
require("plugins.format")
require("plugins.lint")
require("plugins.oil")
require("plugins.surround")
require("plugins.autotag")
require("plugins.persistence")
require("plugins.which-key")
require("plugins.todo-comments")
require("plugins.harpoon")
require("plugins.fugitive")
require("plugins.obsidian")

require("vim._core.ui2").enable({})
