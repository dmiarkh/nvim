vim.pack.add({
	{ src = "https://github.com/Saghen/blink.cmp", version = "v1" },
	"https://github.com/L3MON4D3/LuaSnip",
	"https://github.com/rafamadriz/friendly-snippets",
})

require("blink.cmp").setup({
	keymap = {
		preset = "default",
		["<C-d>"] = { "scroll_documentation_down", "fallback" },
		["<C-u>"] = { "scroll_documentation_up", "fallback" },
	},
	signature = { enabled = true, window = { border = "rounded" } },
	snippets = { preset = "luasnip" },
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
		-- sorts = {
		-- 	function(a, b)
		-- 		if (a.client_name == nil or b.client_name == nil) or (a.client_name == b.client_name) then
		-- 			return
		-- 		end
		-- 		return b.client_name == "emmet"
		-- 	end,
		-- 	"score",
		-- 	"sort_text",
		-- },
	},
})

require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()

vim.api.nvim_create_autocmd("VimEnter", {
	once = true,
	callback = function()
		local pack = vim.iter(vim.pack.get()):find(function(p)
			return p.spec.name == "LuaSnip"
		end)
		if not pack or vim.uv.fs_stat(pack.path .. "/deps/luasnip-jsregexp.so") then
			return
		end
		vim.system({ "make", "install_jsregexp" }, { cwd = pack.path }, function(result)
			vim.schedule(function()
				if result.code == 0 then
					vim.notify("LuaSnip: jsregexp built successfully", vim.log.levels.INFO)
				else
					vim.notify("LuaSnip: jsregexp build failed:\n" .. result.stderr, vim.log.levels.ERROR)
				end
			end)
		end)
	end,
})
