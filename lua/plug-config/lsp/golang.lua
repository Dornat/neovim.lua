local root_pattern = require 'lspconfig'.util.root_pattern
local M = {}

M.opts = {
  cmd = { 'golangci-lint-langserver' },
  root_dir = root_pattern('go.mod', '.golangci.yaml', '.git'),
  filetypes = { 'go', 'gomod' },
  init_options = {
    command = { 'golangci-lint', 'run', '--enable', 'whitespace', '--out-format', 'json', '--issues-exit-code=1' },
  },
}

return M
