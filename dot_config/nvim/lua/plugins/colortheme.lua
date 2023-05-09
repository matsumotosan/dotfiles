return {
  -- 'catppuccin/nvim',
  -- name = 'catppuccin',
  -- version = false,
  -- lazy = false,
  -- priority = 1000,
  -- config = function()
  --   require('catppuccin').setup({
  --     flavor = 'mocha',
  --     background = {
  --       light = 'mocha',
  --       dark = 'frappe',
  --     },
  --     transparent_background = true,
  --     no_italic = true,
  --     no_bold = true,
  --   })
  --   vim.cmd('colorscheme catppuccin')
  -- end,

  -- 'rose-pine/neovim',
  -- name = 'rose-pine',
  -- priority = 1000,
  -- config = function()
  --   require('rose-pine').setup({
  --     variant = 'moon',
  --     dim_nc_background = true,
  --     disable_background = true,
  --   })
  --   vim.cmd('colorscheme rose-pine')
  -- end

  -- 'ellisonleao/gruxbox.nvim',
  -- name = 'gruvbox',
  -- priority = 1000,
  -- config = function()
  --   require('gruvbox').setup({
  --     transparent_mode = true,
  --   })
  --   vim.cmd('colorscheme gruvbox')
  --   end

  'sainnhe/gruvbox-material',
  priority = 1000,
  lazy = false,
  config = function()
    vim.g.gruvbox_material_background = 'hard'
    vim.g.gruvbox_material_transparent_background = 2
    vim.cmd.colorscheme("gruvbox-material")
  end,
}
