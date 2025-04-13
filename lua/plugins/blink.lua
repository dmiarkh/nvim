return {
	"saghen/blink.cmp",
	version = "*",
	event = "VeryLazy",
	dependencies = { "rafamadriz/friendly-snippets" },
	---@module 'blink.cmp'
	opts = {
		keymap = {
			preset = "default",
			["<C-d>"] = { "scroll_documentation_down", "fallback" },
			["<C-u>"] = { "scroll_documentation_up", "fallback" },
		},
		signature = { enabled = true, window = { border = "rounded" } },
		completion = {
			keyword = {
				range = "full",
			},
			menu = {
				border = "rounded",
				draw = {
					columns = {
						{ "kind_icon" },
						{ "label", "label_description" },
						{ "kind" },
					},
					components = {
						kind_icon = {
							text = function(ctx)
								local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
								return kind_icon
							end,
							-- -- Highlights from mini.icons
							-- highlight = function(ctx)
							-- 	local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
							-- 	return hl
							-- end,
						},
					},
				},
			},
			documentation = { window = { border = "rounded" } },
		},
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		fuzzy = {
			implementation = "prefer_rust_with_warning",
			sorts = {
				function(a, b)
					if (a.client_name == nil or b.client_name == nil) or (a.client_name == b.client_name) then
						return
					end
					return b.client_name == "emmet"
				end,
				"score",
				"sort_text",
			},
		},
	},
	opts_extend = { "sources.default" },
}
