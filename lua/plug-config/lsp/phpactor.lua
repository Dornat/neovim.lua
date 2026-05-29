local M = {}

M.opts = {
  cmd = { 'phpactor', 'language-server' },
  filetypes = { 'php' },
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    if fname:match('^fugitive://') then
      return
    end
    local root = vim.fs.root(bufnr, { 'composer.json', '.git' })
    if root then
      on_dir(root)
    end
  end,
}

return M
