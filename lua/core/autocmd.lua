-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	group = vim.api.nvim_create_augroup("checktime", { clear = true }),
	callback = function()
		if vim.o.buftype ~= "nofile" then
			vim.cmd("checktime")
		end
	end,
})

-- Lsp-integrated file renaming for Oil
vim.api.nvim_create_autocmd("User", {
	pattern = "OilActionsPost",
	callback = function(event)
		if event.data.actions.type == "move" then
			Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
		end
	end,
})

-- Disable spell check for Notes
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = vim.fn.expand("~") .. "/Notes/*.md",
	command = "set nospell",
})

-- Enable spell check when leaving Notes
vim.api.nvim_create_autocmd("BufLeave", {
	pattern = vim.fn.expand("~") .. "/Notes/*.md",
	command = "set spell",
})

-- Resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
	group = vim.api.nvim_create_augroup("resize_splits", { clear = true }),
	callback = function()
		local current_tab = vim.fn.tabpagenr()
		vim.cmd("tabdo wincmd =")
		vim.cmd("tabnext " .. current_tab)
	end,
})

-- Close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("close_with_q", { clear = true }),
	pattern = {
		"PlenaryTestPopup",
		"checkhealth",
		"dbout",
		"fugitive",
		"gitsigns.blame",
		"grug-far",
		"help",
		"lspinfo",
		"neotest-output",
		"neotest-output-panel",
		"neotest-summary",
		"notify",
		"qf",
		"spectre_panel",
		"startuptime",
		"tsplayground",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", {
			buffer = event.buf,
			silent = true,
			desc = "Quit buffer",
		})
	end,
})

-- Go to last location when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
	group = vim.api.nvim_create_augroup("last_loc", { clear = true }),
	callback = function(event)
		local exclude = { "gitcommit" }
		local buf = event.buf
		if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
			return
		end
		vim.b[buf].lazyvim_last_loc = true
		local mark = vim.api.nvim_buf_get_mark(buf, '"')
		local lcount = vim.api.nvim_buf_line_count(buf)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("wrap_spell", { clear = true }),
	pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd({ "FileType" }, {
	group = vim.api.nvim_create_augroup("json_conceal", { clear = true }),
	pattern = { "json", "jsonc", "json5" },
	callback = function()
		vim.opt_local.conceallevel = 0
	end,
})

-- LSP progress
vim.api.nvim_create_autocmd("LspProgress", {
	callback = function(ev)
		local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
		vim.notify(vim.lsp.status(), vim.log.levels.INFO, {
			id = "lsp_progress",
			title = "LSP Progress",
			opts = function(notif)
				notif.icon = ev.data.params.value.kind == "end" and " "
					or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
			end,
		})
	end,
})

-- LSP keybinds
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", {
		clear = true,
	}),
	callback = function(args)
		-- Prefer lsp.foldexpr if available
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client:supports_method("textDocument/foldingRange") then
			local win = vim.api.nvim_get_current_win()
			vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
		end

		local function map(mode, lhs, rhs, desc)
			local opts = { buffer = args.buf, noremap = true, silent = true, desc = "LSP: " .. desc }
			vim.keymap.set(mode, lhs, rhs, opts)
		end

		map("n", "K", function()
			vim.lsp.buf.hover({ border = "rounded" })
		end, "Hover")
		map("i", "<C-k>", vim.lsp.buf.signature_help, "Signature help")
		map("n", "gd", function()
			Snacks.picker.lsp_definitions()
		end, "Go to definition")
		map("n", "gD", function()
			Snacks.picker.lsp_declarations()
		end, "Go to declaration")
		map("n", "gri", function()
			Snacks.picker.lsp_implementations({ include_current = true })
		end, "Show LSP implementations")
		map("n", "gr", function()
			Snacks.picker.lsp_references({ include_current = true })
		end, "Show LSP references")
		map("n", "<leader>d", vim.diagnostic.open_float, "Show line diagnostic")
		map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
		map("n", "<leader>D", function()
			Snacks.picker.diagnostics_buffer()
		end, "Show buffer diagnostics")
		map("n", "gt", function()
			Snacks.picker.lsp_type_definitions({ include_current = true })
		end, "Go to type definition")
		map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
		map("n", "[d", function()
			vim.diagnostic.jump({ count = -1, float = true })
		end, "Go to previous diagnostic")
		map("n", "[e", function()
			vim.diagnostic.jump({ severity = vim.diagnostic.severity.ERROR, count = -1, float = true })
		end, "Go to previous error")
		map("n", "]e", function()
			vim.diagnostic.jump({ severity = vim.diagnostic.severity.ERROR, count = 1, float = true })
		end, "Go to next error")
		map("n", "]d", function()
			vim.diagnostic.jump({ count = 1, float = true })
		end, "Go to next diagnostic")
		map("n", "<leader>sd", Snacks.picker.lsp_symbols, "Show document symbols")
		map("n", "<leader>sw", Snacks.picker.lsp_workspace_symbols, "Show workspace symbols")

		if client and client.name == "typescript" then
			map("n", "<leader>co", function()
				client:exec_cmd({
					title = "Organize imports",
					command = "_typescript.organizeImports",
					arguments = { vim.api.nvim_buf_get_name(0) },
				})
			end, "Organize imports")
		end

		if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
			Snacks.toggle.inlay_hints({ name = "inlay hints" }):map("<leader>ch")
			-- map("n", "<leader>ch", function()
			-- 	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({
			-- 		bufnr = args.buf,
			-- 	}))
			-- end, "Toggle inlay hints")
		end
	end,
})
