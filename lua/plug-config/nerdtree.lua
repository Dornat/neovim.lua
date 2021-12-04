local nmap = require'util'.nmap
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require'nvim-tree'.setup {
  -- Force closing neovim when the tree is the last window in the view.
  auto_close          = true,
  -- Keeps the cursor on the first letter of the filename when movint in the tree.
  hijack_cursor       = true,
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  git = {
    enable = false,
    ignore = false,
    timeout = 0,
  },
  view = {
    mappings = {
      custom_only = false,
      list = {
        { key = {"<CR>", "l", "<2-LeftMouse>"}, cb = tree_cb("edit") },
        { key = {"<Tab>", "f",               }, cb = tree_cb("preview") },
      }
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  }
}

nmap('<leader>e', ':lua vim.api.nvim_command(\'NvimTreeToggle\')<cr>')
-- Collapse all opened folders.
nmap('<leader>-', ':lua require\'nvim-tree.lib\'.collapse_all()<cr>')
