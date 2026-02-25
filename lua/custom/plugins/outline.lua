-- outline.nvim
--  see https://github.com/hedyhli/outline.nvim

return {
  'hedyhli/outline.nvim',
  lazy = true,
  cmd = { 'Outline', 'OutlineOpen' },
  keys = {
    { '<leader>o', '<cmd>Outline<CR>', desc = 'Toggle Outline' },
  },
  opts = {
    outline_window = {
      position = 'right',
      width = 25,
    },
    symbol_folding = {
      autofold_depth = false, -- 全部展开，不自动折叠
    },
  },
}
