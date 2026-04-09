vim.pack.add({ "https://github.com/obsidian-nvim/obsidian.nvim" })

require("obsidian").setup({
	workspaces = {
		{
			name = "personal",
			path = "~/Notes/",
		},
	},
	-- ui = {
	-- 	enable = false,
	-- },
	new_notes_location = "notes_subdir",
	note_id_func = require("obsidian.builtin").title_id,
	picker = {
		name = "snacks.pick",
	},
	legacy_commands = false,
	frontmatter = {
		enabled = true,
		func = function(note)
			local out = { id = note.id, aliases = note.aliases, tags = note.tags }

			if note.path then
				local parent = vim.fs.basename(vim.fs.dirname(tostring(note.path))):lower()
				if parent ~= "." and not vim.tbl_contains(out.tags, parent) then
					table.insert(out.tags, parent)
				end
			end

			return vim.tbl_extend("force", out, note.metadata or {})
		end,
	},
})

vim.keymap.set("n", "<leader>fo", "<cmd>Obsidian search<cr>", { desc = "Find obsidian" })
