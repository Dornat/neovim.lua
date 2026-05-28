local nmap = require 'util'.nmap

local function my_on_attach(bufnr)
  local api = require 'nvim-tree.api'

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.map.on_attach.default(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
  vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
end

require('nvim-tree').setup {
  on_attach = my_on_attach,
  filters = {
    dotfiles = true,
  },
  git = {
    ignore = true,
  },
}

nmap('<leader>e', ":lua vim.api.nvim_command('NvimTreeToggle')<cr>")
-- Collapse all opened folders.
nmap('<leader>-', ':NvimTreeCollapse<cr>')
-- Find current file in the tree.
nmap('<leader>=', ':NvimTreeFindFile<cr>')
