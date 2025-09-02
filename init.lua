local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
require("core.options")

require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	ui = {
		border = "rounded",
	},
	rocks = {
		enabled = false,
	},
	checker = { enabled = true, notify = false },
	performance = {
		rtp = {
			disabled_plugins = {
				"2html_plugin",
				"bugreport",
				"compiler",
				"ftplugin",
				"getscript",
				"getscriptPlugin",
				"gzip",
				"man",
				"matchit",
				"matchparen",
				"netrw",
				"netrwFileHandlers",
				"netrwPlugin",
				"netrwSettings",
				"rplugin",
				"syntax",
				"tar",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zip",
				"zipPlugin",
			},
		},
	},
})

require("core.keymaps")
require("core.autocmd")

vim.lsp.enable({
	"bash",
	-- "biome",
	"css",
	"emmet",
	"go",
	"html",
	"json",
	"lua",
	"tailwindcss",
	"typescript",
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
		source = false,
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
		source = true,
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
