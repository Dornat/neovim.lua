local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
print(vim.inspect(vim.fn.glob('')))
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end


return require('packer').startup(function(use)
  -- The best color scheme in the universe!
  use 'morhetz/gruvbox'
  -- Status line.
  use {
    'nvim-lualine/lualine.nvim',
    -- Nerd icons.
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- Treesitter.
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'nvim-treesitter/playground'
  -- TODO Delete
  use 'nvim-treesitter/nvim-tree-docs'
  use {
    'kkoomen/vim-doge',
    run = function ()
      vim.fn['doge#install']()
    end
  }

  -- Telescope.
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- Fzf for Telescope.
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  -- Proper root directory.
  use 'airblade/vim-rooter'

  -- Almost like NerdTree but not really.
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    }
  }

  -- Comment stuff out.
  use 'terrortylor/nvim-comment'
  -- Show indentations.
  use 'lukas-reineke/indent-blankline.nvim'
  -- Automatically create pairs for symbols.
  use 'windwp/nvim-autopairs'

  -- LSP.
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client.
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin.
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp.
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp.
  use 'L3MON4D3/LuaSnip' -- Snippets plugin.

  -- Execute code in file.
  use {
    'michaelb/sniprun',
    run = 'bash ./install.sh',
    required = {
      { 'rcarriga/nvim-notify' }
    }
  }

  -- Git signs in gutter.
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
  }

  --
  -- use {
  --   'CRAG666/code_runner.nvim',
  --   requires = 'nvim-lua/plenary.nvim'
  -- }

  --if packer_bootstrap then
  --  require('packer').sync()
  --end
end)
