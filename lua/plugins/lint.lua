vim.pack.add({ "https://github.com/mfussenegger/nvim-lint" })

local lint = require("lint")

lint.linters_by_ft = {
	javascript = { "eslint_d" },
	typescript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	typescriptreact = { "eslint_d" },
	sh = { "shellcheck" },
	bash = { "shellcheck" },
}

-- Autolint debounce
local timer = vim.uv.new_timer()

local function debounced_lint()
	timer:start(
		200,
		0,
		vim.schedule_wrap(function()
			local bufname = vim.api.nvim_buf_get_name(0)
			if bufname ~= "" and vim.bo.buftype == "" then
				lint.try_lint()
			end
		end)
	)
end

local lint_augroup = vim.api.nvim_create_augroup("nvim-lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	callback = debounced_lint,
})

-- vim.keymap.set("n", "<leader>ll", function()
-- 	lint.try_lint()
-- end, { desc = "Lint current file" })
--
-- vim.keymap.set("n", "<leader>ls", function()
-- 	local running = lint.get_running()
-- 	if #running == 0 then
-- 		vim.notify("No linters running", vim.log.levels.INFO)
-- 	else
-- 		vim.notify("Running: " .. table.concat(running, ", "), vim.log.levels.INFO)
-- 	end
-- end, { desc = "Show running linters" })
