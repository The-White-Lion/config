local M = {}

M.opts = {
  plugins = { spelling = true },
  defaults = {
    mode = { "n", "v" },
    -- ["g"] = { name = "+goto" },
    ["]"] = { name = "+next" },
    ["["] = { name = "+prev" },
    ["<leader>f"] = { name = "+file/find" },
    ["<leader>s"] = { name = "+search" },
    ["<leader>g"] = { name = "+git" },
  }
}

function M.config(_, opts)
  local wk = require("which-key")
  wk.setup(opts)
  wk.register(opts.defaults)
end

return M
