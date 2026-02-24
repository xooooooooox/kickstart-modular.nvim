-- markdown.nvim
--  see https://github.com/tadmccorkle/markdown.nvim

return {
  'tadmccorkle/markdown.nvim',
  ft = 'markdown',
  opts = {
    mappings = {
      link_follow = '<CR>',
      inline_surround_toggle = false,
      inline_surround_toggle_line = false,
      inline_surround_delete = false,
      inline_surround_change = false,
      link_add = false,
      go_curr_heading = false,
      go_parent_heading = false,
      go_next_heading = false,
      go_prev_heading = false,
    },
  },
  config = function(_, opts)
    require('markdown').setup(opts)

    local augroup = vim.api.nvim_create_augroup('MarkdownNav', { clear = true })

    -- <BS> 返回上一个文件（利用 Vim jump list）
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'markdown',
      group = augroup,
      callback = function(ev)
        vim.keymap.set('n', '<BS>', '<C-o>', {
          buffer = ev.buf,
          desc = 'Go back (markdown nav)',
        })
      end,
    })

    -- Preview 跟随：进入 md buffer 时刷新共享 preview page
    vim.api.nvim_create_autocmd('BufEnter', {
      pattern = '*.md',
      group = augroup,
      callback = function()
        if vim.g._mkdp_preview_active then
          vim.schedule(function()
            pcall(vim.cmd, 'MarkdownPreview')
          end)
        end
      end,
    })
  end,
}
