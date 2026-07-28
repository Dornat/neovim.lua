local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  { 'ellisonleao/gruvbox.nvim', priority = 1000 },
  'nvim-tree/nvim-web-devicons',
  { 'nvim-tree/nvim-tree.lua', dependencies = { 'nvim-tree/nvim-web-devicons' } },
  { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },
  { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
  'nvim-telescope/telescope-ui-select.nvim',
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require 'plug-config.treesitter'
    end,
  },
  'airblade/vim-rooter',
  'terrortylor/nvim-comment',
  'windwp/nvim-autopairs',
  'williamboman/mason.nvim',
  'neovim/nvim-lspconfig',
  'b0o/SchemaStore.nvim',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'saadparwaiz1/cmp_luasnip',
  'L3MON4D3/LuaSnip',
  'onsails/lspkind-nvim',
  { 'fatih/vim-go', build = ':GoUpdateBinaries' },
  { 'mfussenegger/nvim-lint' },
  'mfussenegger/nvim-dap',
  { 'rcarriga/nvim-dap-ui', dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' } },
  'nvim-neotest/nvim-nio',
  'mhartington/formatter.nvim',
  { 'lewis6991/gitsigns.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
  'sindrets/diffview.nvim',
  {
    'selimacerbas/markdown-preview.nvim',
    -- Installed under this name while iamcco's plugin (same repo basename) was still around.
    -- Kept so lazy doesn't re-clone into the directory that one used.
    name = 'markdown-preview-acerbas',
    dependencies = { 'selimacerbas/live-server.nvim' },
    cmd = { 'MarkdownPreview', 'MarkdownPreviewRefresh', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    config = function()
      require('markdown_preview').setup {
        default_theme = 'dark',
        -- 'takeover' shares one server on a fixed port 8421 across nvim sessions, so a second
        -- session either silently updates the first one's tab or fails to bind. 'multi' gives each
        -- session its own server on an OS-assigned port.
        instance_mode = 'multi',
        -- The plugin only auto-opens a tab when it owns the server and thinks no tab is attached,
        -- and its attached-tab count goes stale when you close a tab. on_start fires on every
        -- start, so opening from here works in cases the built-in path misses. Trade-off: running
        -- :MarkdownPreview twice can leave you with two tabs.
        open_browser = false,
        hooks = {
          on_start = function(url)
            vim.ui.open(url)
          end,
        },
      }
    end,
  },
})
