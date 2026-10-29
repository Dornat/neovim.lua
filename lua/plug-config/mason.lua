local mason_bin = vim.fn.stdpath('data') .. '/mason/bin'
if not string.find(vim.env.PATH, mason_bin, 1, true) then
  vim.env.PATH = mason_bin .. ':' .. vim.env.PATH
end

local pio_toolchains = vim.fn.expand('~/.platformio/packages/toolchain-*/bin')
for _, path in ipairs(vim.fn.glob(pio_toolchains, true, true)) do
  if not string.find(vim.env.PATH, path, 1, true) then
    vim.env.PATH = path .. ':' .. vim.env.PATH
  end
end

require 'mason'.setup({
  ui = {
    icons = {
      package_installed = '✓',
      package_pending = '➜',
      package_uninstalled = '✗',
    },
  },
})

local registry = require 'mason-registry'
local packages = { 'json-lsp', 'yaml-language-server', 'taplo', 'clangd', 'html-lsp', 'prettier', 'intelephense' }

for _, pkg_name in ipairs(packages) do
  if registry.has_package(pkg_name) then
    local pkg = registry.get_package(pkg_name)
    if not pkg:is_installed() then
      pkg:install()
    end
  end
end
