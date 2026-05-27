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

-- Toggle relative line numbers.
nmap('<leader>rnu', ':set rnu!<cr>')

-- Format with formatter.nvim (fallback when no LSP attached).
nmap('<leader>f', '<cmd>Format<cr>')

-- For yanking to paste elsewhere like llm
vim.keymap.set('v', '<leader>ya', function()
  yank.yank_visual_with_path(yank.get_buffer_absolute(), 'absolute')
end, { desc = '[Y]ank selection with [A]bsolute path' })
vim.keymap.set('v', '<leader>yr', function()
  yank.yank_visual_with_path(yank.get_buffer_cwd_relative(), 'relative')
end, { desc = '[Y]ank selection with [R]elative path' })
