local root_pattern = require('lspconfig').util.root_pattern

local M = {}

local clangd_cmd = 'clangd'
local mason_clangd = vim.fn.stdpath('data') .. '/mason/bin/clangd'
if vim.fn.executable(clangd_cmd) == 0 and vim.fn.executable(mason_clangd) == 1 then
  clangd_cmd = mason_clangd
end

M.opts = {
  cmd = {
    clangd_cmd,
    '--background-index',
    '--clang-tidy',
    '--header-insertion=iwyu',
    '--completion-style=detailed',
    '--function-arg-placeholders',
    '--query-driver=/home/dornat/.platformio/packages/toolchain-xtensa-esp32/bin/xtensa-esp32-elf-g++,/home/dornat/.platformio/packages/toolchain-xtensa-esp32/bin/xtensa-esp32-elf-gcc,**/*gcc*,**/*g++*,**/*xtensa*',
  },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
  root_dir = root_pattern('compile_commands.json', 'compile_flags.txt', 'platformio.ini', 'CMakeLists.txt', '.git'),
  capabilities = {
    offsetEncoding = { 'utf-16' },
  },
}

return M
