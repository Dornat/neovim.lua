-- Floating scratch terminal: toggle a single persistent terminal buffer in a
-- centered floating window. The buffer is reused across toggles so the shell
-- session and scrollback survive closing/reopening the window.
local M = {}

local state = {
  buf = nil, -- persistent terminal buffer
  win = nil, -- current float window (nil when hidden)
}

local function open()
  -- Create the terminal buffer once, keep it around between toggles.
  if not (state.buf and vim.api.nvim_buf_is_valid(state.buf)) then
    state.buf = vim.api.nvim_create_buf(false, true)
  end

  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  state.win = vim.api.nvim_open_win(state.buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded',
    title = ' terminal ',
    title_pos = 'center',
  })

  -- Match the float to the editor's normal background instead of the darker
  -- NormalFloat that gruvbox applies to floating windows.
  vim.wo[state.win].winhighlight = 'NormalFloat:Normal,FloatBorder:Normal'

  -- Start a shell in the buffer the first time it is shown.
  if vim.bo[state.buf].buftype ~= 'terminal' then
    vim.fn.jobstart(vim.o.shell, { term = true })
  end

  vim.cmd('startinsert')
end

function M.toggle()
  if state.win and vim.api.nvim_win_is_valid(state.win) then
    vim.api.nvim_win_hide(state.win)
    state.win = nil
  else
    open()
  end
end

return M
