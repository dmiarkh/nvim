return {
	"luukvbaal/statuscol.nvim",
	config = function()
		local builtin = require("statuscol.builtin")
		require("statuscol").setup({
			segments = {
				{ text = { "%s" }, click = "v:lua.scsa" },
				{ text = { builtin.lnumfunc }, click = "v:lua.scla" },
				{
					text = { " ", builtin.foldfunc, " " },
					condition = { builtin.not_empty, true, builtin.not_empty },
					click = "v:lua.scfa",
				},
			},
		})
	end,
}
