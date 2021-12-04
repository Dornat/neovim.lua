local map = require'util'.map
local nmap = require'util'.nmap
local imap = require'util'.imap

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
