vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
})

local lsp_to_install = {
	"bashls",
	"cssls",
	"emmet_language_server",
	-- "eslint",
	"gopls",
	"html",
	"jsonls",
	"lua_ls",
	"stylua",
	"tailwindcss",
	"ts_ls",
}

local tools_to_install = {
	"black",
	"eslint_d",
	"isort",
	"prettier",
	"prettierd",
	"shellcheck",
	"shfmt",
}

require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "×",
		},
		border = "rounded",
	},
})

require("mason-tool-installer").setup({
	ensure_installed = tools_to_install,
})

require("mason-lspconfig").setup({
	ensure_installed = lsp_to_install,
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})

-- LSP progress
vim.api.nvim_create_autocmd("LspProgress", {
	buffer = buf,
	callback = function(ev)
		local value = ev.data.params.value
		vim.api.nvim_echo({ { value.message or "done" } }, false, {
			id = "lsp." .. ev.data.client_id,
			kind = "progress",
			source = "vim.lsp",
			title = value.title,
			status = value.kind ~= "end" and "running" or "success",
			percent = value.percentage,
		})
	end,
})

-- vim.api.nvim_create_autocmd("LspProgress", {
-- 	callback = function(ev)
-- 		local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
-- 		vim.notify(vim.lsp.status(), vim.log.levels.INFO, {
-- 			id = "lsp_progress",
-- 			title = "LSP Progress",
-- 			opts = function(notif)
-- 				notif.icon = ev.data.params.value.kind == "end" and " "
-- 					or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
-- 			end,
-- 		})
-- 	end,
-- })

-- Lsp-integrated file renaming for Oil
vim.api.nvim_create_autocmd("User", {
	pattern = "OilActionsPost",
	callback = function(event)
		if event.data.actions.type == "move" then
			Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
		end
	end,
})

-- LSP keybinds
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", {
		clear = true,
	}),
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client:supports_method("textDocument/foldingRange") then
			local has_ts_parser = pcall(vim.treesitter.get_parser, args.buf)
			if not has_ts_parser then
				local win = vim.api.nvim_get_current_win()
				vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
			end
		end

		local function map(mode, lhs, rhs, desc)
			local opts = { buffer = args.buf, noremap = true, silent = true, desc = "LSP: " .. desc }
			vim.keymap.set(mode, lhs, rhs, opts)
		end

		map("n", "K", function()
			vim.lsp.buf.hover({ border = "rounded" })
		end, "Hover")

		if client and client:supports_method("textDocument/implementation") then
			map("n", "gri", function()
				Snacks.picker.lsp_implementations({ include_current = true })
			end, "Show LSP implementations")
		end

		if client and client:supports_method("textDocument/references") then
			map("n", "grr", function()
				Snacks.picker.lsp_references({ include_current = true })
			end, "Show LSP references")
		end

		if client and client:supports_method("textDocument/typeDefinition") then
			map("n", "grt", function()
				Snacks.picker.lsp_type_definitions({ include_current = true })
			end, "Go to type definition")
		end

		map("n", "<leader>d", vim.diagnostic.open_float, "Show line diagnostic")
		map("n", "<leader>D", function()
			Snacks.picker.diagnostics_buffer()
		end, "Show buffer diagnostics")
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
		map("n", "grs", Snacks.picker.lsp_symbols, "Show document symbols")
		map("n", "grS", Snacks.picker.lsp_workspace_symbols, "Show workspace symbols")

		if client and client:supports_method("textDocument/codeAction") then
			map({ "n", "v" }, "gra", vim.lsp.buf.code_action, "Code action")
		end

		if client and client:supports_method("textDocument/rename") then
			map("n", "grn", vim.lsp.buf.rename, "Rename")
		end

		if client and client:supports_method("textDocument/signatureHelp") then
			map("i", "<C-k>", vim.lsp.buf.signature_help, "Signature help")
		end

		if client and client:supports_method("textDocument/definition") then
			map("n", "gd", function()
				Snacks.picker.lsp_definitions()
			end, "Go to definition")
		end

		if client and client:supports_method("textDocument/declaration") then
			map("n", "gD", function()
				Snacks.picker.lsp_declarations()
			end, "Go to declaration")
		end

		if client and client:supports_method("textDocument/documentColor") then
			vim.lsp.document_color.enable(true, nil, { style = "virtual" })
			map("n", "grc", vim.lsp.document_color.color_presentation, "Change color presentation")
		end

		if client and client.name == "typescript" then
			map("n", "grd", function()
				client:exec_cmd({
					title = "Organize imports",
					command = "_typescript.organizeImports",
					arguments = { vim.api.nvim_buf_get_name(0) },
				})
			end, "Organize imports")
		end

		-- TODO: implement inlay hints
		-- if client and client:supports_method("textDocument/inlayHint") then
		-- 	local inlay_hints_group = vim.api.nvim_create_augroup("toggle_inlay_hints", { clear = false })
		--
		-- 	if vim.g.inlay_hints then
		-- 		-- Initial inlay hint display.
		-- 		-- Idk why but without the delay inlay hints aren't displayed at the very start.
		-- 		vim.defer_fn(function()
		-- 			local mode = vim.api.nvim_get_mode().mode
		-- 			vim.lsp.inlay_hint.enable(mode == "n" or mode == "v", { bufnr = bufnr })
		-- 		end, 500)
		-- 	end
		--
		-- 	vim.api.nvim_create_autocmd("InsertEnter", {
		-- 		group = inlay_hints_group,
		-- 		desc = "Enable inlay hints",
		-- 		buffer = bufnr,
		-- 		callback = function()
		-- 			if vim.g.inlay_hints then
		-- 				vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
		-- 			end
		-- 		end,
		-- 	})
		--
		-- 	vim.api.nvim_create_autocmd("InsertLeave", {
		-- 		group = inlay_hints_group,
		-- 		desc = "Disable inlay hints",
		-- 		buffer = bufnr,
		-- 		callback = function()
		-- 			if vim.g.inlay_hints then
		-- 				vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
		-- 			end
		-- 		end,
		-- 	})
		-- end
		--
		-- -- Raplace with snacks lsp-specific toggle?
		-- if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
		-- 	Snacks.toggle.inlay_hints({ name = "inlay hints" }):map("<leader>ch")
		-- 	-- map("n", "<leader>ch", function()
		-- 	-- 	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({
		-- 	-- 		bufnr = args.buf,
		-- 	-- 	}))
		-- 	-- end, "Toggle inlay hints")
		-- end
	end,
})

local icons = {
	ERROR = " ",
	WARN = " ",
	HINT = " ",
	INFO = " ",
}

-- TODO: show only 1 diagnostic message if many
vim.diagnostic.config({
	underline = true,
	update_in_insert = false,
	virtual_text = {
		spacing = 2,
		source = false,
		prefix = function(diagnostic)
			return icons[vim.diagnostic.severity[diagnostic.severity]] or "●"
		end,
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = icons.ERROR,
			[vim.diagnostic.severity.WARN] = icons.WARN,
			[vim.diagnostic.severity.HINT] = icons.HINT,
			[vim.diagnostic.severity.INFO] = icons.INFO,
		},
	},
	severity_sort = true,
	float = {
		border = "rounded",
		source = true,
	},
	codelens = {
		enabled = true,
	},
	capabilities = {
		workspace = {
			fileOperations = {
				didRename = true,
				willRename = true,
			},
		},
	},
	format = {
		formatting_options = nil,
		timeout_ms = nil,
	},
})
