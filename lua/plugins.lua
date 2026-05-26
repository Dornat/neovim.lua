local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  'morhetz/gruvbox',
  'nvim-tree/nvim-web-devicons',
  { 'nvim-tree/nvim-tree.lua', dependencies = { 'nvim-tree/nvim-web-devicons' } },
  { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },
  { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate', config = function() require'plug-config.treesitter' end },
  'airblade/vim-rooter',
  'terrortylor/nvim-comment',
  'lukas-reineke/indent-blankline.nvim',
  'windwp/nvim-autopairs',
  'williamboman/mason.nvim',
  'neovim/nvim-lspconfig',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'saadparwaiz1/cmp_luasnip',
  'L3MON4D3/LuaSnip',
  { 'tzachar/cmp-tabnine', build = './install.sh', dependencies = { 'hrsh7th/nvim-cmp' } },
  'onsails/lspkind-nvim',
  { 'fatih/vim-go', build = ':GoUpdateBinaries' },
  { 'mfussenegger/nvim-lint' },
  'mfussenegger/nvim-dap',
  'mhartington/formatter.nvim',
  'tpope/vim-fugitive',
  { 'junegunn/gv.vim', dependencies = { 'tpope/vim-fugitive' } },
  { 'lewis6991/gitsigns.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
  'OXY2DEV/markview.nvim',
})
