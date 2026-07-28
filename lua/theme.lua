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
  overrides = {},
})

vim.cmd [[ colorscheme gruvbox ]]
