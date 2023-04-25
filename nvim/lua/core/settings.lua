local M = {}

function M:load_options()
  local default_options = {
    mouse = "i",
    backup = false,
    fileencoding = "utf-8",
    cmdheight = 1,
    completeopt = { "menuone", "noselect" },
    number = true,
    numberwidth = 2,
    relativenumber = true,
    wrap = true,
    cursorline = true,
    splitbelow = true,
    splitright = true,
    expandtab = true,
    shiftwidth = 2,
    tabstop = 2,
    timeoutlen = 500,
    incsearch = true,
    hlsearch = true,
  }

  for k, v in pairs(default_options) do
    vim.opt[k] = v
  end
end

return M
