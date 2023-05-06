local M = {}

M.keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" }}

M.opts = {
  -- auto install lsp servers/formaters
  ensure_installed = {
    "stylua",
    "lua-language-server"
  },
}

function M.config(_, opts)
  require("mason").setup(opts)
  local mr = require("mason-registry")
  local function ensure_installed()
    for _, tool in ipairs(opts.ensure_installed) do
      local p = mr.get_package(tool)
      if not p:is_installed() then
        p:install()
      end
    end
  end

  if mr.refresh then
    mr.refresh(ensure_installed)
  else
    ensure_installed()
  end
end

return M
