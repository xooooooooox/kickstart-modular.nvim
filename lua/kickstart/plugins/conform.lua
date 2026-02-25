return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Opt-in: only auto-format these filetypes on save.
        -- Add filetypes here to enable, e.g. { lua = true, python = true }
        local enable_filetypes = {}
        if enable_filetypes[vim.bo[bufnr].filetype] then
          return {
            timeout_ms = 500,
            lsp_format = 'fallback',
          }
        end
        return nil
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        sh = { 'shfmt' },
        bash = { 'shfmt' },
        zsh = { 'shfmt' },
        python = { 'isort', 'black' },
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        markdown = { 'prettier' },
        html = { 'prettier' },
        css = { 'prettier' },
        json = { 'prettier' },
        yaml = { 'prettier' },
        -- Conform can also run multiple formatters sequentially
        -- go = { "goimports", "gofmt" },
        --
        -- You can use 'stop_after_first' to run the first available formatter from the list
        -- typescript = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
