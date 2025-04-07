return {
	-- {
	-- 	"brenoprata10/nvim-highlight-colors",
	-- 	event = { "BufReadPre", "BufNewFile" },
	-- 	opts = {
	-- 		enable_tailwind = true,
	-- 		render = "virtual",
	-- 		virtual_symbol = "󰝤 ",
	-- 		virtual_symbol_suffix = "",
	-- 		enable_hex = false,
	-- 		enable_short_hex = false,
	-- 		enable_rgb = false,
	-- 		enalbe_hsl = false,
	-- 		enable_hsl_without_function = false,
	-- 		enable_var_usage = false,
	-- 		enable_named_colors = false,
	-- 	},
	-- },
	{
		"catgoose/nvim-colorizer.lua",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			filetypes = {
				"*",
			},
			user_default_options = {
				names = false,
				RRGGBBAA = true,
				AARRGGBB = true,
				css = true,
				css_fn = true,
				rgb_fn = true,
				hsl_fn = true,
				-- tailwind = "lsp",
				-- tailwind_opts = {
				-- 	update_names = true,
				-- },
				-- mode = "virtualtext",
				-- virtualtext_inline = "before",
				-- virtualtext = "󰝤 ",
			},
		},
	},
}
