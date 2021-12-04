-- Required to keep multiple buffers open.
vim.o.hidden = true
-- Display long lines as just one line.
vim.o.wrap = false
-- The encoding displayed.
vim.o.encoding = 'utf-8'
-- The encoding written to file.
vim.o.fileencoding = 'utf-8'
-- For terminal colors.
vim.o.termguicolors = true
vim.o.background = 'dark'
-- Enable mouse.
vim.o.mouse = 'a'
-- Horizontal splits will automatically be below.
vim.o.splitbelow = true
-- Vertical splits will automatically be to the right.
vim.o.splitright = true
-- Insert 4 spaces for a tab.
vim.o.tabstop = 4
-- Change the number of space characters inserted for indentation.
vim.o.shiftwidth = 4
-- Converts tabs to spaces.
vim.bo.expandtab = true
-- Makes indenting smart.
vim.bo.smartindent = true
-- Display line numbers.
vim.o.number = true
-- Display relative line numbers.
vim.o.rnu = true
-- Faster completion.
vim.o.updatetime = 300
-- Mappings timeout.
vim.o.timeoutlen = 500
-- Stop newline continuation of comments.
vim.opt.formatoptions:remove('cro')
-- Copy paste between vim and everything else.
vim.opt.clipboard:append('unnamedplus')
-- Display a vertical line on 120 character.
vim.wo.cc = '120'
-- File specific spacing.
vim.cmd [[autocmd Filetype lua setlocal tabstop=2 shiftwidth=2 softtabstop=0 expandtab]]
vim.cmd [[autocmd Filetype css setlocal tabstop=2 shiftwidth=2 softtabstop=0 expandtab]]
vim.cmd [[autocmd Filetype json setlocal tabstop=2 shiftwidth=2 softtabstop=0 expandtab]]
vim.cmd [[autocmd Filetype scss setlocal tabstop=2 shiftwidth=2 softtabstop=0 expandtab]]
vim.cmd [[autocmd Filetype typescript setlocal tabstop=2 shiftwidth=2 softtabstop=0 expandtab]]
vim.cmd [[autocmd Filetype yaml setlocal tabstop=2 shiftwidth=2 softtabstop=0 expandtab]]
vim.cmd [[autocmd Filetype yml setlocal tabstop=2 shiftwidth=2 softtabstop=0 expandtab]]
