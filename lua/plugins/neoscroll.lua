return {
  "karb94/neoscroll.nvim",
  config = function()
    require('neoscroll').setup({
      mappings = { '<C-u>', '<C-d>', '<C-f>',
        '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
    })
  end
}
