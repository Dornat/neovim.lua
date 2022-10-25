require'indent_blankline'.setup {
  char_list = {'|', '¦', '┆', '┊'},
  -- context_patterns = {'class', 'function', 'method', 'if', 'foreach'},
  -- show_current_context = true,
  -- show_current_context_start = true,
  show_trailing_blankline_indent = false,
  use_treesitter = true,
  bufname_exclude = {'.*\\.txt'}
}
