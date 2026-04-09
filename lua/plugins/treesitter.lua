vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/nvim-treesitter/nvim-treesitter-context",
	"https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
})

local ts = require("nvim-treesitter")

ts.setup({
	install_dir = vim.fn.stdpath("data") .. "/site",
})

local parsers = {
	"bash",
	"c",
	"cmake",
	"css",
	"csv",
	"diff",
	"dockerfile",
	"gitignore",
	"go",
	"graphql",
	"html",
	"hyprlang",
	"javascript",
	"jq",
	"jsdoc",
	"json",
	"lua",
	"luadoc",
	"luap",
	"markdown",
	"markdown_inline",
	"prisma",
	"python",
	"qmljs",
	"query",
	"regex",
	"scss",
	"sql",
	"tmux",
	"toml",
	"tsv",
	"tsx",
	"typescript",
	"vimdoc",
	"xml",
	"yaml",
	"zsh",
}

ts.install(parsers)

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		if ev.data.spec.name == "nvim-treesitter" and ev.data.kind == "update" then
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
		end
	end,
	desc = "Run TSUpdate after nvim-treesitter is updated",
})

vim.api.nvim_create_autocmd("FileType", {
	callback = function(ev)
		local lang = vim.treesitter.language.get_lang(ev.match)
		if not lang then
			return
		end

		local parserInstalled = pcall(vim.treesitter.language.add, lang)
		if not parserInstalled then
			ts.install({ lang })
			return
		end

		local tsRunning = pcall(vim.treesitter.start, ev.buf)

		if tsRunning then
			vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end

		-- Folding
		if pcall(vim.treesitter.get_parser, ev.buf) then
			vim.wo[0][0].foldmethod = "expr"
			vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
			vim.cmd.normal("zx")
		end
	end,
	desc = "Autoinstall ts parsers, enable indentation and folding",
})

require("treesitter-context").setup({
	max_lines = 5,
	multiline_threshold = 2, -- Maximum number of lines to show for a single context
})

require("nvim-treesitter-textobjects").setup({
	move = {
		set_jumps = true,
	},
	select = {
		lookahead = true,
		include_surrounding_whitespace = true,
	},
})

-- Select
vim.keymap.set({ "x", "o" }, "af", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
end, { desc = "outer function" })
vim.keymap.set({ "x", "o" }, "if", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
end, { desc = "inner function" })
vim.keymap.set({ "x", "o" }, "ac", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
end, { desc = "outer class" })
vim.keymap.set({ "x", "o" }, "ic", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
end, { desc = "inner class" })
vim.keymap.set({ "x", "o" }, "aa", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@parameter.outer", "textobjects")
end, { desc = "outer parameter" })
vim.keymap.set({ "x", "o" }, "al", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@loop.outer", "textobjects")
end, { desc = "outer loop" })
vim.keymap.set({ "x", "o" }, "il", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@loop.inner", "textobjects")
end, { desc = "inner loop" })
vim.keymap.set({ "x", "o" }, "ai", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@conditional.outer", "textobjects")
end, { desc = "outer condition" })
vim.keymap.set({ "x", "o" }, "ii", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@conditional.inner", "textobjects")
end, { desc = "inner condition" })

-- Swap
vim.keymap.set("n", "<leader>a", function()
	require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
end, { desc = "Swap with next parameter" })
vim.keymap.set("n", "<leader>A", function()
	require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.outer")
end, { desc = "Swap with previous parameter" })

-- Move
vim.keymap.set({ "n", "x", "o" }, "]f", function()
	require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
end, { desc = "next function start" })
vim.keymap.set({ "n", "x", "o" }, "]c", function()
	require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
end, { desc = "next class start" })
vim.keymap.set({ "n", "x", "o" }, "]l", function()
	require("nvim-treesitter-textobjects.move").goto_next_start("@loop.outer", "textobjects")
end, { desc = "next loop start" })
vim.keymap.set({ "n", "x", "o" }, "]i", function()
	require("nvim-treesitter-textobjects.move").goto_next_start("@conditional.outer", "textobjects")
end, { desc = "next condition start" })

vim.keymap.set({ "n", "x", "o" }, "]F", function()
	require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
end, { desc = "next function end" })
vim.keymap.set({ "n", "x", "o" }, "]C", function()
	require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
end, { desc = "next class end" })
vim.keymap.set({ "n", "x", "o" }, "]L", function()
	require("nvim-treesitter-textobjects.move").goto_next_end("@loop.outer", "textobjects")
end, { desc = "next loop end" })
vim.keymap.set({ "n", "x", "o" }, "]I", function()
	require("nvim-treesitter-textobjects.move").goto_next_end("@conditional.outer", "textobjects")
end, { desc = "next condition end" })

vim.keymap.set({ "n", "x", "o" }, "[f", function()
	require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
end, { desc = "previous function start" })
vim.keymap.set({ "n", "x", "o" }, "[c", function()
	require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
end, { desc = "previous class start" })
vim.keymap.set({ "n", "x", "o" }, "[l", function()
	require("nvim-treesitter-textobjects.move").goto_previous_start("@loop.outer", "textobjects")
end, { desc = "previous loop start" })
vim.keymap.set({ "n", "x", "o" }, "[i", function()
	require("nvim-treesitter-textobjects.move").goto_previous_start("@conditional.outer", "textobjects")
end, { desc = "previous condition start" })

vim.keymap.set({ "n", "x", "o" }, "[F", function()
	require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
end, { desc = "previous function end" })
vim.keymap.set({ "n", "x", "o" }, "[C", function()
	require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
end, { desc = "previous class end" })
vim.keymap.set({ "n", "x", "o" }, "[L", function()
	require("nvim-treesitter-textobjects.move").goto_previous_end("@loop.outer", "textobjects")
end, { desc = "previous loop end" })
vim.keymap.set({ "n", "x", "o" }, "[I", function()
	require("nvim-treesitter-textobjects.move").goto_previous_end("@conditional.outer", "textobjects")
end, { desc = "previous condition end" })

local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")
vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
--     incremental_selection = {
--         enable = true,
--         keymaps = {
--             init_selection = "<C-space>",
--             node_incremental = "<C-space>",
--             scope_incremental = false,
--             node_decremental = "<bs>",
--         },
