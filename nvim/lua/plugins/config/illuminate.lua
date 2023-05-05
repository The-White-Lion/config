local M = {}

M.opts = {
  delay = 150,
  filetypes_denylist = {
    "dashboard",
    "alpha",
    "neo-tree",
    "lazy",
    "mason",
  },
}

function M.config(_, opts)
  require("illuminate").configure(opts)
  local function map(key, action, buffer)
    vim.keymap.set("n", key, function()
      require("illuminate")["goto_" .. action .. "_reference"](false)
    end, { desc = action:sub(1, 1):upper() .. action:sub(2):upper() .. " Reference", buffer = buffer })
  end

  map("]]", "next")
  map("[[", "prev")

  -- set it after loading ftplugins, since a lot overwrite [[ and ]]
  vim.api.nvim_create_autocmd("FileType", {
    callback = function()
      local buffer = vim.api.nvim_get_current_buf()
      map("]]", "next", buffer)
      map("[[", "prev", buffer)
    end,
  })
end

M.keys = {
  { "[[", desc = "Prev Prefence" },
  { "]]", desc = "Next Prefence" },
}

return M
