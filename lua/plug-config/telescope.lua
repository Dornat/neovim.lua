local nmap = require'util'.nmap

require'telescope'.setup {
  defaults = {
    preview = {
      timeout = 1000
    }
  },
  pickers = {
    find_files = {
      --hidden = true,
      find_command = {
        "rg",
        "--files",
        "--hidden",
        "--no-ignore"
      }
    },
    lsp_references = {
      layout_strategy = 'vertical',
      layout_config = {
        width = 0.98
      },
      path_display = {
        shorten = {
          len = 3,
          exclude = {1, -3, -2, -1}
        }
      }
    },
  }
}

-- Load fzf here.
require('telescope').load_extension('fzf')

local M = {}

-- Falling back to find_files if git_files can't find a .git directory.
M.project_files = function()
  local ok = pcall(require'telescope.builtin'.git_files, {})
  if not ok then
    require'telescope.builtin'.find_files()
  end
end

-- Provide a string to search for a symbol in the whole workspace.
M.grep_workspace_symbols = function()
  require'telescope.builtin'.lsp_workspace_symbols {
    query = vim.fn.input('Enter symbols > ')
  }
end

-- Live grep for specific directory.
M.live_grep_in_dir = function()
  local prompt = 'Live grepping in dir'
  local dir = vim.fn.input(prompt .. ' > ')

  require'telescope.builtin'.live_grep {
    prompt_title = prompt .. ': ' .. dir .. '/',
    search_dirs = {
      dir
    }
  }
end

nmap('<leader>ff', "<cmd>lua require('plug-config.telescope').project_files()<cr>")

nmap('<leader>fq', "<cmd>lua require('telescope.builtin').quickfix()<cr>")
nmap('<leader>fm', "<cmd>lua require('telescope.builtin').marks()<cr>")
nmap('<leader>fe', "<cmd>lua require('telescope.builtin').file_browser()<cr>")
nmap('<leader>fp', "<cmd>lua require('telescope.builtin').git_files()<cr>")
nmap('<leader>fd', "<cmd>lua require('telescope.builtin').find_files()<cr>")
nmap('<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>")
nmap('<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>")
nmap('<leader>fo', "<cmd>lua require('plug-config.telescope').live_grep_in_dir()<cr>")
nmap('<leader>fu', "<cmd>lua require('telescope.builtin').jumplist()<cr>")
nmap('<leader>fs', "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>")

-- LSP specific.
nmap('<leader>fr', "<cmd>lua require('telescope.builtin').lsp_references()<cr>")
nmap('<leader>fw', "<cmd>lua require('plug-config.telescope').grep_workspace_symbols()<cr>")
nmap('<leader>fl', "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>")
nmap('gr', "<cmd>lua require('telescope.builtin').lsp_references()<cr>")
nmap('gd', "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>")

return M
