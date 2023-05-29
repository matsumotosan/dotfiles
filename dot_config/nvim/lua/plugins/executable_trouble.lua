return {
  'folke/trouble.nvim',
  -- dependencies = {
  --   'kyazdani42/nvim-web-devicons',
  -- },
  config = function()
    local icons = require "config.icons"

    require('trouble').setup({
      icons = true,
      signs = {
        error = icons.diagnostics.Error,
        warning = icons.diagnostics.Warning,
        hint = icons.diagnostics.Hint,
        information = icons.diagnostics.Information,
      },
      use_diagnostic_signs = true,
    })
  end,
}
