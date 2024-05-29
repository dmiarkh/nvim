return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"nvim-treesitter/nvim-treesitter-context",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = {
				enable = true,
			},
			indent = { enable = true },
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"scss",
				"prisma",
				"markdown",
				"markdown_inline",
				"graphql",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"query",
				"vimdoc",
				"hyprlang",
			},
			auto_install = true,
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",

						["ab"] = "@block.outer",
						["ib"] = "@block.inner",

						["aa"] = "@parameter.outer",
						["ia"] = "@parameter.inner",

						["a="] = "@assignment.lhs",
						["i="] = "@assignment.rhs",

						["ai"] = "@conditional.outer",
						["ii"] = "@conditional.inner",

						["al"] = "@loop.outer",
						["il"] = "@loop.inner",
					},
				},
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["]m"] = "@function.outer",
					},
					goto_next_end = {
						["]M"] = "@function.outer",
					},
					goto_previous_start = {
						["[m"] = "@function.outer",
					},
					goto_previous_end = {
						["[M"] = "@function.outer",
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>na"] = "@parameter.inner",
						["<leader>nf"] = "@function.outer",
					},
					swap_previous = {
						["<leader>pa"] = "@parameter.inner",
						["<leader>pf"] = "@function.outer",
					},
				},
			},
		})

		require("treesitter-context").setup({
			event = "VeryLazy",
			enable = true,
			max_lines = 5, -- How many lines the window should span. Values <= 0 mean no limit.
			min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
			line_numbers = true,
			multiline_threshold = 2, -- Maximum number of lines to show for a single context
			trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
			mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
			-- Separator between context and content. Should be a single character string, like '-'.
			-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
			separator = nil,
			zindex = 20, -- The Z-index of the context window
			on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
		})

		local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

		vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
		vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

		vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
		vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
		vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
		vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
	end,

	vim.filetype.add({
		pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
	}),
}
