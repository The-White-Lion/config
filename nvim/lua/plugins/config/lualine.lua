local M = {}

local color = {
  bg = "#202328",
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
    local command = "pyenv version"
    local handle = io.popen(command)
    if handle == nil then
      return ""
    end

    local output = handle:read("*a")
    if output == nil then
      return ""
    end
    local env = string.match(output, "(.-)%s")
    handle:close()
    -- if env ~= "system" then
    --   return ""
    -- end
    return env
  end
  return ""
end

M.opts = {
  options = {
    disabled_filetypes = {
      statusline = { "dashboard", "alpha" },
    },
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = { {
      function()
        return " " .. icons.ui.Target
      end,
      padding = { left = 0, right = 0 },
      color = {},
      cond = nil,
    } },
    lualine_b = {
      {
        "branch",
        icon = { icons.git.Branch, color = { fg = color.orange } },
      },
    },
    lualine_c = {
      {
        "diagnostics",
        symbols = {
          error = icons.diagnostics.BoldError,
          warn = icons.diagnostics.BoldWarning,
          info = icons.diagnostics.BoldInformation,
          hit = icons.diagnostics.BoldHint,
        },
      },
      {
        "filename",
        file_status = true,
        newfile_status = true,
        path = 0,
        symbols = {
          modified = icons.ui.File,
          readonly = icons.ui.Lock,
          unnamed = "[No Name]",
          newfile = "[New]",
        },
      },
    },
    lualine_x = {
      {
        function()
          local shiftwidth = vim.api.nvim_buf_get_option(0, "shiftwidth")
          return icons.ui.Tab .. shiftwidth
        end,
        padding = 1,
      },
      { "filetype",  padding = { left = 0, right = 1 } },
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
        color = { fg = color.magenta }
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
      end
    },
  },
  extensions = { "neo-tree", "lazy" },
}

return M
