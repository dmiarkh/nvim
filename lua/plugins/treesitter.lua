return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	build = ":TSUpdate",
	event = { "BufReadPost", "BufWritePost", "BufNewFile", "VeryLazy" },
	lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"nvim-treesitter/nvim-treesitter-context",
	},
	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
	keys = {
		{ "<c-space>", desc = "Increment Selection" },
		{ "<bs>", desc = "Decrement Selection", mode = "x" },
	},
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("nvim-treesitter.configs").setup({
			highlight = { enable = true },
			indent = { enable = true },
			ensure_installed = {
				"bash",
				"c",
				"css",
				"diff",
				"dockerfile",
				"gitignore",
				"go",
				"graphql",
				"html",
				"hyprlang",
				"javascript",
				"jsdoc",
				"json",
				"jsonc",
				"lua",
				"luadoc",
				"luap",
				"markdown",
				"markdown_inline",
				"printf",
				"prisma",
				"python",
				"query",
				"regex",
				"scss",
				"sql",
				"toml",
				"tsv",
				"tsx",
				"typescript",
				"vimdoc",
				"xml",
				"yaml",
				"qmljs",
			},
			autoinstall = true,
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
				move = {
					enable = true,
					goto_next_start = {
						["]f"] = "@function.outer",
						["]c"] = "@class.outer",
						["]a"] = "@parameter.inner",
					},
					goto_next_end = {
						["]F"] = "@function.outer",
						["]C"] = "@class.outer",
						["]A"] = "@parameter.inner",
					},
					goto_previous_start = {
						["[f"] = "@function.outer",
						["[c"] = "@class.outer",
						["[a"] = "@parameter.inner",
					},
					goto_previous_end = {
						["[F"] = "@function.outer",
						["[C"] = "@class.outer",
						["[A"] = "@parameter.inner",
					},
				},
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["if"] = "@function.inner",
						["af"] = "@function.outer",

						["ic"] = "@class.inner",
						["ac"] = "@class.outer",

						["ia"] = "@parameter.inner",
						["aa"] = "@parameter.outer",

						["i="] = "@assignment.lhs",
						["a="] = "@assignment.rhs",

						["ii"] = "@conditional.inner",
						["ai"] = "@conditional.outer",

						["il"] = "@loop.inner",
						["al"] = "@loop.outer",
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>a"] = "@parameter.inner",
						["<leader>m"] = "@function.outer",
					},
					swap_previous = {
						["<leader>A"] = "@parameter.inner",
						["<leader>M"] = "@function.outer",
					},
				},
			},

			vim.filetype.add({
				pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
			}),
		})
		require("treesitter-context").setup({
			event = { "BufReadPost", "BufWritePost", "BufNewFile", "VeryLazy" },
			max_lines = 5, -- How many lines the window should span. Values <= 0 mean no limit.
			multiline_threshold = 2, -- Maximum number of lines to show for a single context
		})

		local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

		vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
		vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

		vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
		vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
		vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
		vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
	end,
}
