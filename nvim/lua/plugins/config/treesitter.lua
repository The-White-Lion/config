local M = {}

M.opts = {
	highlight = { enable = true },
	ident = { enable = true },
	context_commentstring = { enable = true, enable_autocmd = false },
	ensure_installed = {
		"bash",
		"c",
		"go",
		"html",
		"javascript",
		"lua",
		"luadoc",
		"luap",
		"markdown",
		"markdown_inline",
		"python",
		"query",
		"regex",
		"typescript",
		"vim",
		"vimdoc",
		"yaml",
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<enter>", -- set to `false` to disable one of the mappings
			node_incremental = "<enter>",
			scope_incremental = "<enter>",
			node_decremental = "<bs>",
		},
	},
}

function M.config(_, opts)
	if type(opts.ensure_installed) == "table" then
		local added = {}
		opts.ensure_installed = vim.tbl_filter(function(lang)
			if added[lang] then
				return false
			end
			added[lang] = true
			return true
		end, opts.ensure_installed)
	end
	require("nvim-treesitter.configs").setup(opts)
end

M.keys = {
	{ "<c-space>", desc = "Increment selection" },
	{ "<bs>", desc = "Decrement selection", mode = "x" },
}

return M
