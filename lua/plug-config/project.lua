local nmap = require'util'.nmap

require('telescope').load_extension('projects')

nmap('<leader>p', ':Telescope projects<cr>')
