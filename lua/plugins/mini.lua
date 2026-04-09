vim.pack.add({
	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/JoosepAlviste/nvim-ts-context-commentstring",
})

require("mini.icons").setup({
	file = {
		[".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
		["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
	},
	filetype = {
		dotenv = { glyph = "", hl = "MiniIconsYellow" },
	},
})
MiniIcons.mock_nvim_web_devicons()

require("mini.pairs").setup()

require("mini.splitjoin").setup({
	mappings = {
		toggle = "gs",
	},
})

require("mini.comment").setup({
	options = {
		custom_commentstring = function()
			return require("ts_context_commentstring").calculate_commentstring() or vim.bo.commentstring
		end,
	},
})

-- Custom comment bindings
local function get_comment_prefix()
	local prefix = vim.bo.commentstring:match("^(.-)%s*%%s") or ""
	if not prefix:match("%s$") then
		prefix = prefix .. " "
	end
	return prefix
end

local function comment_next_line()
	local row = vim.api.nvim_win_get_cursor(0)[1]
	local indent = vim.api.nvim_buf_get_lines(0, row - 1, row, false)[1]:match("^%s*") or ""
	local prefix = get_comment_prefix()
	vim.api.nvim_buf_set_lines(0, row, row, false, { indent .. prefix })
	vim.api.nvim_win_set_cursor(0, { row + 1, #(indent .. prefix) })
	vim.cmd("startinsert!")
end

local function comment_prev_line()
	local row = vim.api.nvim_win_get_cursor(0)[1]
	local indent = vim.api.nvim_buf_get_lines(0, row - 1, row, false)[1]:match("^%s*") or ""
	local prefix = get_comment_prefix()
	vim.api.nvim_buf_set_lines(0, row - 1, row - 1, false, { indent .. prefix })
	vim.api.nvim_win_set_cursor(0, { row, #(indent .. prefix) })
	vim.cmd("startinsert!")
end

local function comment_end_of_line()
	local line = vim.api.nvim_win_get_cursor(0)[1]
	local content = vim.api.nvim_buf_get_lines(0, line - 1, line, false)[1]
	local cs = vim.bo.commentstring:match("^(.-)%s*%%s") or vim.bo.commentstring:gsub("%%s.*", ""):gsub("%s+$", "")
	vim.api.nvim_buf_set_lines(0, line - 1, line, false, { content .. " " .. cs .. " " })
	local new_col = #content + #cs + 3
	vim.api.nvim_win_set_cursor(0, { line, new_col })
	vim.cmd("startinsert!")
end

vim.keymap.set("n", "gco", comment_next_line, { desc = "Comment next line" })
vim.keymap.set("n", "gcO", comment_prev_line, { desc = "Comment previous line" })
vim.keymap.set("n", "gcA", comment_end_of_line, { desc = "Comment end of line" })
