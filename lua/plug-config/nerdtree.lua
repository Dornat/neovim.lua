local nmap = require'util'.nmap

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-t>',  api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', '?',      api.tree.toggle_help,           opts('Help'))
  vim.keymap.set('n', 'l',      api.node.open.edit,             opts('Open'))
end

require("nvim-tree").setup {
  on_attach = my_on_attach,
}

-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
--require'nvim-tree'.setup {
--  respect_buf_cwd = true,
--  -- Force closing neovim when the tree is the last window in the view.
--  -- auto_close          = true,
--  -- Keeps the cursor on the first letter of the filename when movint in the tree.
--  -- hijack_cursor       = true,
--  diagnostics = {
--    enable = true,
--    icons = {
--      hint = "",
--      info = "",
--      warning = "",
--      error = "",
--    }
--  },
--  git = {
--    enable = false,
--    ignore = false,
--    timeout = 0,
--  },
--  view = {
--    mappings = {
--      custom_only = false,
--      list = {
--        { key = {"<CR>", "l", "<2-LeftMouse>"}, cb = tree_cb("edit") },
--        { key = {"<Tab>", "f",               }, cb = tree_cb("preview") },
--      }
--    },
--  },
--  trash = {
--    cmd = "trash",
--    require_confirm = true
--  },
--  -- update_cwd = true,
--}

nmap('<leader>e', ':lua vim.api.nvim_command(\'NvimTreeToggle\')<cr>')
-- Collapse all opened folders.
nmap('<leader>-', ':lua require\'nvim-tree.lib\'.collapse_all()<cr>')
-- Find current file in the tree.
nmap('<leader>=', ':lua require\'nvim-tree\'.find_file(true)<cr>')
