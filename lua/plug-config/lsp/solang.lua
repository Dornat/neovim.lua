local M = {}

M.opts = {
  cmd = {
    "solang",
    "--language-server",
    "--target",
    "ewasm"
  },
  filetypes = {
    "sol",
    "solidity"
  }
}

return M
