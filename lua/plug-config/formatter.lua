require('formatter').setup({
  filetype = {
    javascript = {
      function()
        return {
          exe = 'npx biome check --fix',
          args = { '--stdin-file-path', vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
          stdin = true,
        }
      end,
    },
    typescript = {
      function()
        return {
          exe = 'npx biome check --fix',
          args = { '--stdin-file-path', vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
          stdin = true,
        }
      end,
    },
    typescriptreact = {
      function()
        return {
          exe = 'npx biome check --fix',
          args = { '--stdin-file-path', vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
          stdin = true,
        }
      end,
    },
    json = {
      function()
        return {
          exe = 'npx @biomejs/biome check --fix',
          args = {
            '--indent-style=space',
            '--indent-width=2',
            '--stdin-file-path',
            vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
          },
          stdin = true,
        }
      end,
    },
    lua = {
      function()
        return {
          exe = vim.fn.stdpath('data') .. '/mason/bin/stylua',
          args = { '--search-parent-directories', '-' },
          stdin = true,
        }
      end,
    },
    sh = {
      function()
        return {
          exe = vim.fn.stdpath('data') .. '/mason/bin/shfmt',
          args = { '-i', '2', '-filename', vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
          stdin = true,
        }
      end,
    },
  },
})
