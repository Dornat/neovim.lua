local nmap = require 'util'.nmap

require 'telescope'.setup {
  defaults = {
    layout_strategy = 'vertical',
    layout_config = {
      width = 0.98,
    },
    preview = {
      timeout = 1000,
    },
  },
  pickers = {
    find_files = {
      --hidden = true,
      find_command = {
        'rg',
        '--files',
        '--hidden',
        '--no-ignore',
      },
    },
    lsp_references = {
      layout_strategy = 'vertical',
      layout_config = {
        width = 0.98,
      },
      path_display = {
        shorten = {
          len = 3,
          exclude = { 1, -3, -2, -1 },
        },
      },
    },
  },
}

-- Load fzf here.
require('telescope').load_extension('fzf')
require('telescope').load_extension('ui-select')

local M = {}

-- Falling back to find_files if git_files can't find a .git directory.
M.project_files = function()
  local ok = pcall(require 'telescope.builtin'.git_files, {})
  if not ok then
    require 'telescope.builtin'.find_files()
  end
end

-- Provide a string to search for a symbol in the whole workspace.
M.grep_workspace_symbols = function()
  require 'telescope.builtin'.lsp_workspace_symbols {
    query = vim.fn.input('Enter symbols > '),
  }
end

-- Resolve a directory from the nvim-tree node under the cursor, if the
-- current buffer is an nvim-tree window. Returns nil otherwise.
local function dir_from_nvim_tree()
  if vim.bo.filetype ~= 'NvimTree' then
    return nil
  end

  local ok, api = pcall(require, 'nvim-tree.api')
  if not ok then
    return nil
  end

  local node = api.tree.get_node_under_cursor()
  if not node or not node.absolute_path then
    return nil
  end

  -- Directory node -> that dir; file node -> its parent dir.
  if node.type == 'directory' then
    return node.absolute_path
  end
  return vim.fn.fnamemodify(node.absolute_path, ':h')
end

-- Live grep for specific directory. When invoked from nvim-tree, grep the
-- directory (or parent of the file) under the cursor; otherwise prompt.
M.live_grep_in_dir = function()
  local prompt = 'Live grepping in dir'
  local dir = dir_from_nvim_tree() or vim.fn.input(prompt .. ' > ')

  if dir == '' then
    return
  end

  require 'telescope.builtin'.live_grep {
    prompt_title = prompt .. ': ' .. dir .. '/',
    search_dirs = {
      dir,
    },
  }
end

nmap('<leader>ff', "<cmd>lua require('plug-config.telescope').project_files()<cr>")

nmap('<leader>fq', "<cmd>lua require('telescope.builtin').quickfix()<cr>")
nmap('<leader>fm', "<cmd>lua require('telescope.builtin').marks()<cr>")
nmap('<leader>fd', "<cmd>lua require('telescope.builtin').find_files()<cr>")
nmap('<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>")
nmap('<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>")
nmap('<leader>ft', "<cmd>lua require('telescope.builtin').grep_string()<cr>")
nmap('<leader>fo', "<cmd>lua require('plug-config.telescope').live_grep_in_dir()<cr>")
nmap('<leader>fu', "<cmd>lua require('telescope.builtin').jumplist()<cr>")
nmap('<leader>fs', "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>")

-- LSP specific.
nmap('<leader>fr', "<cmd>lua require('telescope.builtin').lsp_references()<cr>")
nmap('<leader>fw', "<cmd>lua require('plug-config.telescope').grep_workspace_symbols()<cr>")
nmap('<leader>fl', "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>")
nmap('gr', "<cmd>lua require('telescope.builtin').lsp_references()<cr>")
nmap('gd', "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>")
nmap('<leader>fh', "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>")

return M
