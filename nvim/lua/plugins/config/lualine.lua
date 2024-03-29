local M = {}

local color = {
	bg = "#16161e",
	fg = "#bbc2cf",
	yellow = "#ECBE7B",
	cyan = "#008080",
	darkblue = "#081633",
	green = "#98be65",
	orange = "#FF8800",
	violet = "#a9a1e1",
	magenta = "#c678dd",
	purple = "#c678dd",
	blue = "#51afef",
	red = "#ec5f67",
}

local function python_venv()
	if vim.bo.filetype == "python" then
		local env = "system"
		if vim.fn.executable("pyenv") == 1 then
			local handle = io.popen("pyenv version")
			if handle == nil then
				return ""
			end

			local output = handle:read("*a")
			if output == nil then
				return ""
			end
			env = string.match(output, "(.-)%s")
			handle:close()
		end
		return env
	end
	return ""
end

local function create_winbar()
	local util = require("util")

	local function get_filename()
		local filename = vim.fn.expand("%:t")
		local extension = vim.fn.expand("%:e")

		if not util.is_empty(filename) then
			local file_icon, hl_group
			local devicons_ok, devicons = pcall(require, "nvim-web-devicons")
			if devicons_ok then
				file_icon, hl_group = devicons.get_icon(filename, extension, { default = true })

				if util.is_empty(file_icon) then
					file_icon = icons.kind.File
				end
			else
				file_icon = ""
				hl_group = "Normal"
			end

			local buf_ft = vim.bo.filetype

			if buf_ft == "dapui_breakpoints" then
				file_icon = icons.ui.Debug
			end

			if buf_ft == "dapui_stacks" then
				file_icon = icons.ui.Stacks
			end

			if buf_ft == "dapui_scopes" then
				file_icon = icons.ui.Scopes
			end

			if buf_ft == "dapui_watchs" then
				file_icon = icons.ui.Watches
			end
			return " " .. "%#" .. hl_group .. "#" .. file_icon .. " %*" .. filename .. "%*"
		end
	end
	local value = require("nvim-navic").get_location()
	local filename = get_filename()

	if not util.is_empty(value) then
		return filename .. " " .. icons.ui.ChevronRight .. " " .. value
	else
		return filename
	end
end

local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end
local winbar = {
	lualine_c = {
		{
			create_winbar,
			cond = function()
				return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
			end,
		},
	},
}

local sections = {
	lualine_a = {
		{
			function()
				return " " .. icons.ui.Target
			end,
			padding = { left = 0, right = 0 },
			color = {},
			cond = nil,
		},
	},
	lualine_b = {
		{
			"branch",
			icon = { icons.git.Branch, color = { fg = color.orange } },
		},
		{
			"diff",
			colored = true, -- Displays a colored diff status if set to true
			diff_color = {
				added = { fg = color.green, bg = color.bg },
				modified = { fg = color.yellow, bg = color.bg },
				removed = { fg = color.red, bg = color.bg },
			},
			padding = { left = 1, right = 0 },
			symbols = {
				added = icons.git.LineAdded,
				modified = icons.git.LineModified,
				removed = icons.git.LineRemoved,
			},
			source = diff_source,
		},
	},
	lualine_c = {
		{
			"diagnostics",
			padding = { left = 1, right = 0 },
			symbols = {
				error = icons.diagnostics.BoldError,
				warn = icons.diagnostics.BoldWarning,
				info = icons.diagnostics.BoldInformation,
				hint = icons.diagnostics.BoldHint,
			},
		},
		-- {
		-- 	"filename",
		-- 	file_status = true,
		-- 	newfile_status = true,
		-- 	path = 0,
		-- 	symbols = {
		-- 		modified = icons.ui.File,
		-- 		readonly = icons.ui.Lock,
		-- 		unnamed = "[No Name]",
		-- 		newfile = "[New]",
		-- 	},
		-- },
	},
	lualine_x = {
		{
			function()
				local shiftwidth = vim.api.nvim_buf_get_option(0, "shiftwidth")
				return icons.ui.Tab .. shiftwidth
			end,
			padding = 1,
		},
		{ "filetype", padding = { left = 0, right = 1 } },
		{ python_venv, padding = { left = 0, right = 1 } },
	},
	lualine_y = {
		{
			"fileformat",
			symbols = {
				unix = "",
				dos = "",
				mac = "",
			},
			color = { fg = color.magenta },
		},
		{ "progress", padding = { left = 0, right = 0 } },
		{
			function()
				local line = vim.fn.line(".")
				local col = vim.fn.virtcol(".")
				return string.format("ln:%d:%d", line, col)
			end,
			padding = { left = 1, right = 1 },
			color = { fg = color.orange },
		},
	},
	lualine_z = {
		function()
			return icons.ui.Clock .. os.date("%R")
		end,
	},
}

M.opts = {
	options = {
		theme = "auto",
		disabled_filetypes = {
			statusline = { "dashboard", "alpha" },
		},
		globalstatus = true,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
	},
	winbar = winbar,
	inactive_winbar = winbar,
	sections = sections,
	-- inactive_sections = sections,
	extensions = { "neo-tree", "lazy" },
}

return M
