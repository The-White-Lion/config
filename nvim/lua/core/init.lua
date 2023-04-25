local M = {}

function M:init()
  vim.g.mapleader = " "

  require("core.settings"):load_options()

  local bind = require("keymap.bind")
  local keymap = require("core.mapping")
  bind:load_keys(keymap)
end

return M
