local nvim_lsp = require('lspconfig')
local on_attach = require'plug-config.lsp.utils'.on_attach
local sumneko_opts = require'plug-config.lsp.sumneko'.opts
local phpactor_opts = require'plug-config.lsp.phpactor'.opts
local psalm_opts = require'plug-config.lsp.psalm'.opts
-- local solang_opts = require'plug-config.lsp.solang'.opts
local table_merge = require'util'.table_merge
local lspkind = require'lspkind'



-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
  'clangd',
  'rust_analyzer',
  'pyright',
  'tsserver',
  {
    name = 'psalm',
    opts = psalm_opts
  },
  {
    name = 'phpactor',
    opts = phpactor_opts
  },
  {
    name = 'sumneko_lua',
    opts = sumneko_opts
  },
  -- {
  --   name = 'solang',
  --   opts = solang_opts
  -- },
}

local lsp_opts = {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  }
}

-- Iterate through servers list. If the server item is a table than grep
-- config options from the table and append lsp_opts to it, else get server name
-- and set lsp_opts.
for key, serv in pairs(servers) do
  if type(serv) == 'table' then
    local serv_opts = servers[key].opts
    local this_spec_opts = table_merge(serv_opts, lsp_opts)
    nvim_lsp[servers[key].name].setup(this_spec_opts)
  else
    nvim_lsp[serv].setup(lsp_opts)
  end
end

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- luasnip setup
local luasnip = require'luasnip'

local source_mapping = {
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	cmp_tabnine = "[TN]",
	path = "[Path]",
}

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  -- snippet = {
  --   expand = function(args)
  --     require('luasnip').lsp_expand(args.body)
  --   end,
  -- },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-k>'] = cmp.mapping.scroll_docs(-4),
    ['<C-j>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-c>'] = cmp.mapping.close(),
    ['<C-e>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = lspkind.presets.default[vim_item.kind]
      local menu = source_mapping[entry.source.name]
      if entry.source.name == 'cmp_tabnine' then
        if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
          menu = entry.completion_item.data.detail .. ' ' .. menu
        end
        vim_item.kind = ''
      end
      vim_item.menu = menu
      return vim_item
    end
--     format = lspkind.cmp_format({
--       with_text = false, -- do not show text alongside icons
--       maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
--       -- The function below will be called before any actual modifications from lspkind
--       -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
--       -- before = function (entry, vim_item)
--         --   return vim_item
--         -- end
--     })
  },
  sources = {
    { name = 'luasnip' },
    { name = 'cmp_tabnine' },
    { name = 'nvim_lsp' },
  },
}
