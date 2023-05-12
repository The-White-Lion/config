local M = {}

M.keys = {
	{
		"<leader>fe",
		function()
			require("neo-tree.command").execute({ toggle = true, reveal = true, dir = require("util").get_root() })
		end,
		desc = "Explorer Neotree (workspace dir)",
	},
	{
		"<leader>fE",
		function()
			require("neo-tree.command").execute({ toggle = true, reveal = true, dir = vim.loop.cwd() })
		end,
		desc = "Explorer Neotree (cwd)",
	},
	{ "<leader>e", "<leader>fe", desc = "Explorer Neotree (workspace dir)", remap = true },
	{ "<leader>E", "<leader>fE", desc = "Explorer Neotree (cwd)", remap = true },
}
M.opts = {
	popup_border_style = "rounded",
	default_component_configs = {
		indent = {
			with_expanders = true,
			expander_collapsed = icons.ui.ChevronShortRight,
			expander_expanded = icons.ui.ChevronShortDown,
			expander_highlight = "NeoTreeExpander",
			-- last_indent_marker = "",
			-- indent_marker = "",
		},
		icon = {
			folder_empty = icons.ui.EmptyFolder,
		},
	},
	window = {
		position = "left",
		width = 30,
		mappings = {
			["<space>"] = "none",
			["l"] = "open",
			["h"] = "close_node",
		},
	},
	filesystem = {
		filtered_items = {
			bind_to_cwd = false,
			follow_current_file = true,
			visible = false,
			hide_dotfiles = false,
			hide_gitignored = false,
			hide_by_pattern = {},
			always_show = {
				".gitignore",
			},
			never_show_by_pattern = {
				"__pycache__",
			},
		},
	},
}

function M.init()
	vim.g.neo_tree_remove_legacy_commands = 1
	if vim.fn.argc() == 1 then
		local stat = vim.loop.fs_stat(vim.fn.argv(0))
		if stat and stat.type == "directory" then
			require("neo-tree")
		end
	end
end

return M
