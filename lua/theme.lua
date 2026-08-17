require('gruvbox').setup({
  terminal_colors = true,
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = false,
    emphasis = true,
    comments = false,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  contrast = '', -- 'hard', 'soft', or '' (default)
  overrides = {
    -- GitHub-style diff colors: green (new) / red (old), no yellow "changed" line.
    DiffAdd = { bg = '#1e3a24' }, -- fully added line
    DiffChange = { bg = '#14261a' }, -- changed line (darker/subtler green)
    DiffText = { bg = '#2f6a3a' }, -- changed text within a changed line (brighter green)
    DiffDelete = { bg = '#3a1e1e', fg = '#a89984' }, -- deleted line
  },
})

vim.cmd [[ colorscheme gruvbox ]]
