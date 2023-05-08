local M = {}

M.opts = {
	history = true,
	delete_check_events = "TextChanged",
}

M.keys = {
	{
		"<tab>",
		function()
			return require("luasnip").jumpable(1) and "<Plug>luasnip-expand-or-jump" or "<tab>"
		end,
		expr = true,
		silent = true,
		mode = "i",
	},
	{
		"<tab>",
		function()
			require("luasnip").jump(1)
		end,
		mode = "s",
	},
	{
		"<s-tab>",
		function()
			require("luasnip").jump(-1)
		end,
		mode = { "i", "s" },
	},
}
return M
