local M = {}

local intelephense_cmd = 'intelephense'
local mason_intelephense = vim.fn.stdpath('data') .. '/mason/bin/intelephense'
if vim.fn.executable(intelephense_cmd) == 0 and vim.fn.executable(mason_intelephense) == 1 then
  intelephense_cmd = mason_intelephense
end

M.opts = {
  cmd = { intelephense_cmd, '--stdio' },
  filetypes = { 'php' },
  root_markers = { 'composer.json', '.git' },
  settings = {
    intelephense = {
      telemetry = {
        enabled = false,
      },
      -- Listing `stubs` overrides intelephense's defaults entirely, so the full
      -- default PHP stub set is repeated here with `wordpress` added. The
      -- WordPress stubs ship with intelephense, so no extra install is needed.
      stubs = {
        'apache', 'bcmath', 'bz2', 'calendar', 'com_dotnet', 'Core', 'ctype',
        'curl', 'date', 'dba', 'dom', 'enchant', 'exif', 'FFI', 'fileinfo',
        'filter', 'fpm', 'ftp', 'gd', 'gettext', 'gmp', 'hash', 'iconv',
        'imap', 'intl', 'json', 'ldap', 'libxml', 'mbstring', 'meta', 'mysqli',
        'oci8', 'odbc', 'openssl', 'pcntl', 'pcre', 'PDO', 'pdo_ibm',
        'pdo_mysql', 'pdo_pgsql', 'pdo_sqlite', 'pgsql', 'Phar', 'posix',
        'pspell', 'readline', 'Reflection', 'session', 'shmop', 'SimpleXML',
        'snmp', 'soap', 'sockets', 'sodium', 'SPL', 'sqlite3', 'standard',
        'superglobals', 'sysvmsg', 'sysvsem', 'sysvshm', 'tidy', 'tokenizer',
        'xml', 'xmlreader', 'xmlrpc', 'xmlwriter', 'xsl', 'Zend OPcache',
        'zip', 'zlib', 'wordpress',
      },
    },
  },
}

vim.api.nvim_create_autocmd('BufReadCmd', {
  pattern = 'phar://*',
  callback = function(ev)
    local path = vim.api.nvim_buf_get_name(ev.buf)
    local output = vim.fn.system({ 'php', '-r', "echo file_get_contents('" .. path .. "');" })
    if vim.v.shell_error == 0 and output ~= '' then
      local lines = vim.split(output, '\n', { plain = true })
      vim.api.nvim_buf_set_lines(ev.buf, 0, -1, false, lines)
      vim.bo[ev.buf].filetype = 'php'
    end
    vim.bo[ev.buf].buftype = 'nofile'
    vim.bo[ev.buf].modifiable = false
  end,
})

return M
