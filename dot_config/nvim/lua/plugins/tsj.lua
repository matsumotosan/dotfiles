return {
  'Wansmer/treesj',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  keys = {
    { '<leader>tsj', '<cmd>lua require("treesj").toggle()<CR>', desc = "Toggle TreeSJ" },
  },
}
