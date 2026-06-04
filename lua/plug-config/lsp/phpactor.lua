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

vim.api.nvim_create_autocmd('BufReadCmd', {
  pattern = 'phar://*',
  callback = function(ev)
    local path = vim.api.nvim_buf_get_name(ev.buf)
    local output = vim.fn.system({ 'php', '-r', "echo file_get_contents('" .. path .. "');" })
    if vim.v.shell_error == 0 and output ~= '' then
      local lines = vim.split(output, '\n', { plain = true })
      vim.api.nvim_buf_set_lines(ev.buf, 0, -1, false, lines)
      vim.bo[ev.buf].filetype = 'php'
    end
    vim.bo[ev.buf].buftype = 'nofile'
    vim.bo[ev.buf].modifiable = false
  end,
})

return M
