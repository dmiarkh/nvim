vim.pack.add({ "https://github.com/nvim-lualine/lualine.nvim" })

require("lualine").setup({
	options = {
		theme = "catppuccin-nvim",
		globalstatus = vim.o.laststatus == 3,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { statusline = { "snacks_dashboard" } },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			{ "b:gitsigns_head", icon = "" },
			{
				"diff",
				symbols = {
					added = " ",
					modified = " ",
					removed = " ",
				},
				source = function()
					local gitsigns = vim.b.gitsigns_status_dict
					if gitsigns then
						return {
							added = gitsigns.added,
							modified = gitsigns.changed,
							removed = gitsigns.removed,
						}
					end
				end,
			},
		},
		lualine_c = {
			{ "filetype", icon_only = true, separator = "", padding = { left = 2, right = 0 } },
			{ "filename", path = 1, padding = { left = -1 } },
		},
		lualine_x = {
			{
				"lsp_status",
				icon = "",
				show_name = false,
			},
			{
				"diagnostics",
				symbols = {
					error = " ",
					warn = " ",
					info = " ",
					hint = " ",
				},
			},
		},
		lualine_y = {
			{ "filetype", separator = "" },
		},
		lualine_z = {
			function()
				return string.format(" %d:%d / %d ", vim.fn.line("."), vim.fn.col("."), vim.fn.line("$"))
			end,
		},
	},
	extensions = {
		"man",
		"mason",
		"oil",
		"quickfix",
		"fugitive",
	},
})
