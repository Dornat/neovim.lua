local map = require 'util'.map
local nmap = require 'util'.nmap
local imap = require 'util'.imap
local yank = require 'util.yank'

-- Map leader key to Space.
map('', '<Space>', '<Nop>')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- I hate escape more than anything else.
imap('jk', '<esc>')

-- Horizontal screen scroll.
nmap('<c-f>', '10zl')
nmap('<c-b>', '10zh')

-- Insert mode horizontal movement with ease.
imap('<c-f>', '<right>')
imap('<c-b>', '<left>')

-- Use alt + hjkl to resize windows.
nmap('<m-j>', ':resize -2<cr>')
nmap('<m-k>', ':resize +2<cr>')
nmap('<m-h>', ':vertical resize -2<cr>')
nmap('<m-l>', ':vertical resize +2<cr>')

-- Move through quickfix list.
nmap('<m-f>', ':cn<cr>')
nmap('<m-d>', ':cp<cr>')

-- Toggle invisible characters.
nmap('<leader>il', ':set list!<cr>')

-- Toggle between indent guides and full listchars.
vim.keymap.set('n', '<leader>ig', function()
  if vim.b.indent_guides_active then
    vim.opt_local.listchars = { space = '·', tab = '→ ', eol = '¶', trail = '~' }
    vim.b.indent_guides_active = false
  else
    local sw = vim.bo.shiftwidth > 0 and vim.bo.shiftwidth or 2
    vim.opt_local.listchars = { multispace = '│' .. string.rep(' ', sw - 1) }
    vim.b.indent_guides_active = true
  end
  vim.opt_local.list = true
end, { desc = 'Toggle indent guides' })

-- Toggle relative line numbers.
nmap('<leader>rnu', ':set rnu!<cr>')

-- Format with formatter.nvim (fallback when no LSP attached).
nmap('<leader>f', '<cmd>Format<cr>')

-- Go to definition: LSP -> ctags -> references fallback.
vim.keymap.set('n', '<C-]>', function()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if #clients > 0 then
    local client = clients[1]
    local encoding = client.offset_encoding or 'utf-16'
    local params = vim.lsp.util.make_position_params(0, encoding)
    vim.lsp.buf_request(0, 'textDocument/definition', params, function(_, result)
      if result and not vim.tbl_isempty(result) then
        if not vim.islist(result) then
          result = { result }
        end
        local loc = result[1]
        local uri = loc.uri or loc.targetUri
        local range = loc.range or loc.targetSelectionRange
        local target_file = vim.uri_to_fname(uri)
        local target_line = range.start.line + 1
        local current_file = vim.api.nvim_buf_get_name(0)
        local current_line = vim.api.nvim_win_get_cursor(0)[1]
        if target_file == current_file and target_line == current_line then
          require('telescope.builtin').lsp_references()
        else
          vim.cmd('edit +' .. target_line .. ' ' .. vim.fn.fnameescape(target_file))
          vim.api.nvim_win_set_cursor(0, { target_line, range.start.character })
        end
      else
        require('telescope.builtin').lsp_references()
      end
    end)
  else
    vim.cmd('tag ' .. vim.fn.expand('<cword>'))
  end
end, { desc = 'Definition -> ctags -> references' })

-- For yanking to paste elsewhere like llm
vim.keymap.set('v', '<leader>ya', function()
  yank.yank_visual_with_path(yank.get_buffer_absolute(), 'absolute')
end, { desc = '[Y]ank selection with [A]bsolute path' })
vim.keymap.set('v', '<leader>yr', function()
  yank.yank_visual_with_path(yank.get_buffer_cwd_relative(), 'relative')
end, { desc = '[Y]ank selection with [R]elative path' })
vim.keymap.set('v', '<leader>yy', function()
  yank.yank_visual()
end, { desc = '[Y]ank selection without path' })
vim.keymap.set('n', '<leader>ypa', function()
  yank.yank_path(yank.get_buffer_absolute(), 'absolute')
end, { desc = '[Y]ank [P]ath [A]bsolute' })
vim.keymap.set('n', '<leader>ypr', function()
  yank.yank_path(yank.get_buffer_cwd_relative(), 'relative')
end, { desc = '[Y]ank [P]ath [R]elative' })
