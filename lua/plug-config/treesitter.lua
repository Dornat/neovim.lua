require 'nvim-treesitter'.setup()

-- Enable treesitter highlighting for all filetypes with an installed parser.
-- nvim-treesitter 1.0+ only manages parser installation; highlighting must
-- be started separately via Neovim's built-in vim.treesitter.start().
vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    local ok = pcall(vim.treesitter.start, args.buf)
    if not ok then return end
  end,
})

vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
