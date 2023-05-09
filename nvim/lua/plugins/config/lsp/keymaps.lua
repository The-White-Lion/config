local M = {}

function M.get()
  M._keys = {
    { "gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Goto Definition"},
    { "gr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
    { "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
    { "K", vim.lsp.buf.hover, desc = "Hover" },
  }
  return M._keys
end

function M.on_attach(client, buffer)
  local Keys = require("lazy.core.handler.keys")
  local keymaps = {}
  for _, value in ipairs(M.get()) do
    local keys = Keys.parse(value)
    keymaps[keys.id] = keys
  end

  for _, keys in pairs(keymaps) do
    local opts = Keys.opts(keys)
    opts.has = nil
    opts.silent = opts.silent ~= false
    opts.buffer = buffer
    vim.keymap.set(keys.mode or "n", keys[1], keys[2], opts)
  end
end

return M
