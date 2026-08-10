require 'nvim-treesitter'.setup()

-- Enable treesitter highlighting for all filetypes with an installed parser.
-- nvim-treesitter 1.0+ only manages parser installation; highlighting must
-- be started separately via Neovim's built-in vim.treesitter.start().
vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    local ok = pcall(vim.treesitter.start, args.buf)
    if not ok then return end
  end,
})

vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

-- Foldtext that keeps the fold's first line syntax-colored (like the code
-- underneath) *and* appends the "N lines" summary of the classic gray fold.
-- Neovim's foldtext may return a list of {text, highlight-group} chunks, so we
-- rebuild the first line from the Tree-sitter highlight query and tack the
-- count on the end.
function _G.ColoredFoldtext()
  local start = vim.v.foldstart
  local bufnr = vim.api.nvim_get_current_buf()
  local line = vim.api.nvim_buf_get_lines(bufnr, start - 1, start, false)[1] or ''
  local count = vim.v.foldend - vim.v.foldstart + 1
  local suffix = { { ('  … %d lines'):format(count), 'Folded' } }

  local ok, parser = pcall(vim.treesitter.get_parser, bufnr)
  local query = ok and parser and vim.treesitter.query.get(parser:lang(), 'highlights')
  if not (ok and parser and query) then
    return vim.list_extend({ { line, 'Folded' } }, suffix)
  end

  parser:parse({ start - 1, start })
  local tree = parser:tree_for_range({ start - 1, 0, start - 1, #line }, { ignore_injections = false })

  -- Map each byte to a highlight group; later captures override earlier ones,
  -- matching how the real Tree-sitter highlighter resolves overlaps.
  local hls = {}
  for id, node in query:iter_captures(tree:root(), bufnr, start - 1, start) do
    local sr, sc, er, ec = node:range()
    if sr == start - 1 and er == start - 1 then
      local hl = '@' .. query.captures[id] .. '.' .. parser:lang()
      for i = sc, ec - 1 do hls[i] = hl end
    end
  end

  -- Coalesce runs of identical highlight into chunks.
  local chunks = {}
  local i = 0
  while i < #line do
    local hl = hls[i] or 'Folded'
    local j = i
    while j < #line and (hls[j] or 'Folded') == hl do j = j + 1 end
    table.insert(chunks, { line:sub(i + 1, j), hl })
    i = j
  end
  return vim.list_extend(chunks, suffix)
end

vim.o.foldtext = 'v:lua.ColoredFoldtext()'
