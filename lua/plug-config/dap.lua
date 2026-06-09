local dap = require('dap')

dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { vim.fn.stdpath('data') .. '/debug-adapters/vscode-php-debug/out/phpDebug.js' },
}

-- Debug configurations are loaded automatically from .vscode/launch.json in the working directory.
-- Create a .vscode/launch.json per project to keep paths/ports out of this config.

local dapui = require('dapui')
dapui.setup({
  layouts = {
    {
      elements = {
        { id = 'scopes', size = 0.7 },
        { id = 'stacks', size = 0.3 },
      },
      position = 'left',
      size = 40,
    },
    {
      elements = {
        { id = 'repl', size = 0.5 },
        { id = 'console', size = 0.5 },
      },
      position = 'bottom',
      size = 10,
    },
  },
})

dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close()
end

local nmap = require('util').nmap

nmap('<leader>dc', "<cmd>lua require('dap').continue()<cr>")
nmap('<F9>', "<cmd>lua require('dap').continue()<cr>")
nmap('<leader>do', "<cmd>lua require('dap').step_over()<cr>")
nmap('<F8>', "<cmd>lua require('dap').step_over()<cr>")
nmap('<leader>di', "<cmd>lua require('dap').step_into()<cr>")
nmap('<F7>', "<cmd>lua require('dap').step_into()<cr>")
nmap('<leader>du', "<cmd>lua require('dap').step_out()<cr>")
nmap('<leader>db', "<cmd>lua require('dap').toggle_breakpoint()<cr>")
nmap('<leader>dp', "<cmd>lua require('dap').repl.open()<cr>")
nmap('<leader>dl', "<cmd>lua require('dap').run_last()<cr>")
nmap('<leader>dt', "<cmd>lua require('dap').terminate()<cr>")
nmap('<leader>dd', "<cmd>lua require('dapui').toggle()<cr>")
nmap('<leader>de', "<cmd>lua require('dapui').eval()<cr>")
nmap('<leader>df', "<cmd>lua require('dap').focus_frame()<cr>")
nmap('<leader>dk', "<cmd>lua require('dap').up()<cr>")
nmap('<leader>dj', "<cmd>lua require('dap').down()<cr>")
