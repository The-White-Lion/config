local M = {}

local generic_opts = { silent = true, noremap = true }

local mode_adapters = {
	normal_mode = "n",
	insert_mode = "i",
	visual_mode = "v",
	command_mode = "c",
}

function M:set_keymap(mode, key, val)
	local opt = generic_opts
	if type(val) == "table" then
		opt = val[2]
		val = val[1]
	end
	if val then
		vim.keymap.set(mode, key, val, opt)
	else
		vim.keymap.del(mode, key)
	end
end

function M:load_mode(mode, keymaps)
	mode = mode_adapters[mode]
	for key, mapping in pairs(keymaps) do
		M:set_keymap(mode, key, mapping)
	end
end

function M:load_keys(keys)
	for mode, mapping in pairs(keys) do
		M:load_mode(mode, mapping)
	end
end

return M
