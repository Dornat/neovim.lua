local nmap = require 'util'.nmap

require('diffview').setup {
  view = {
    -- 2-way diff: panes stacked top/bottom instead of side-by-side
    default = {
      layout = 'diff2_vertical',
    },
    -- 3-way merge: OURS top-left, THEIRS top-right, RESULT on the bottom
    merge_tool = {
      layout = 'diff3_mixed',
    },
  },
}

nmap('<leader>dvo', ':DiffviewOpen<cr>')
nmap('<leader>dvc', ':DiffviewClose<cr>')

vim.keymap.set('n', '<leader>dvh', function()
  local ref = vim.fn.input('Ref > ', 'HEAD~1')
  if ref ~= '' then
    vim.cmd('DiffviewOpen ' .. ref)
  end
end, { noremap = true, silent = true, desc = 'Diffview open with ref' })

nmap('<leader>dvf', ':DiffviewFileHistory %<cr>')
