local M = {}

M.opts = {
  cmd = { 'phpactor', 'language-server' },
  filetypes = { 'php' },
  root_dir = function(bufnr, on_dir)
    local root = vim.fs.root(bufnr, { 'composer.json', '.git' })
    if root then
      on_dir(root)
    end
  end,
}

return M
