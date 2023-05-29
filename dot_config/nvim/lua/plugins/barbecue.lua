local icons = require('config.icons')

return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
  },
  opts = {
    attach_navic = true,
    show_navic = true,
    show_dirname = false,
    show_basename = true,
    kinds = {
      icons.kinds
    },
    theme = {
      basename = { bold = false },
    },
  },
}
