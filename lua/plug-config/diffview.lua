local nmap = require 'util'.nmap

nmap('<leader>dvo', ':DiffviewOpen<cr>')
nmap('<leader>dvc', ':DiffviewClose<cr>')

vim.keymap.set('n', '<leader>dvh', function()
  local ref = vim.fn.input('Ref > ', 'HEAD~1')
  if ref ~= '' then
    vim.cmd('DiffviewOpen ' .. ref)
  end
end, { noremap = true, silent = true, desc = 'Diffview open with ref' })

nmap('<leader>dvf', ':DiffviewFileHistory %<cr>')
