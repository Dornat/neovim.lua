require('formatter').setup({
  filetype = {
    javascript = {
      function()
        return {
          exe = "npx biome format",
          args = {"--stdin-file-path", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
          stdin = true
        }
      end
    },
    typescript = {
      function()
        return {
          exe = "npx biome format",
          args = {"--stdin-file-path", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
          stdin = true
        }
      end
    },
    typescriptreact = {
      function()
        return {
          exe = "npx biome format",
          args = {"--stdin-file-path", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
          stdin = true
        }
      end
    },
  }
})
