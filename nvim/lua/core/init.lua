local M = {}

function M:init()
	vim.g.mapleader = " "
	vim.g.maplocalleader = " "

	_G.icons = require("util.icons")
	require("core.settings"):load_options()

	local bind = require("keymap.bind")
	local keymap = require("core.mapping")
	bind:load_keys(keymap)

	require("core.lazy")
	require("core.autocmds")
end

return M
