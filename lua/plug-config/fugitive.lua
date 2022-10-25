local nmap = require'util'.nmap

-- Run git status.
nmap('<leader>gs', ':G<cr>')
-- Run git blame.
nmap('<leader>gb', ':Git blame --date=format:"%d/%m/%y"<cr>')
-- Run git diff on current file in vertical split.
nmap('<leader>gd', ':Gvdiffsplit<cr>')
