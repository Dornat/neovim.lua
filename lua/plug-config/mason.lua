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
local packages = { 'json-lsp', 'yaml-language-server', 'taplo' }

for _, pkg_name in ipairs(packages) do
  if registry.has_package(pkg_name) then
    local pkg = registry.get_package(pkg_name)
    if not pkg:is_installed() then
      pkg:install()
    end
  end
end
