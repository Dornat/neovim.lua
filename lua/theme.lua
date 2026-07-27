require('gruvbox').setup({
  terminal_colors = true,
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  contrast = '', -- 'hard', 'soft', or '' (default)
  overrides = {},
})

vim.cmd [[ colorscheme gruvbox ]]
