local M = {}

function M.keys()
  local ret = {}
  for _, key in ipairs({ "f", "F", "t", "T" }) do
    ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
  end
  return ret
end

M.opts = {
  labeled_modes = "nx",
}

return M
