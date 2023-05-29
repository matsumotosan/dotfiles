local icons = require('config.icons')

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'kyazdani42/nvim-web-devicons' },
  opts = {
    options = {
      icons_enabled = true,
      theme = 'gruvbox-material',
      section_separators = { left = '', right = '' },
      component_separators = { left = '', right = '' },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = true,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      }
    },
    sections = {
      lualine_a = {
        {
          'mode',
          color = { bg = '#b16286' }
        }
      },
      lualine_b = {
        {
          'branch',
          icon = icons.git.Branch,
        },
        {
          'diff',
          symbols = {
            added = icons.git.LineAdded,
            modified = icons.git.LineModified,
            removed = icons.git.LineModified,
          },
        },
        {
          'diagnostics',
          sources = { 'nvim_lsp', 'nvim_diagnostic' },
          sections = { 'error', 'warn', 'info', 'hint' },
          symbols = {
            error = icons.diagnostics.Error,
            warn = icons.diagnostics.Warning,
            info = icons.diagnostics.Information,
            hint = icons.diagnostics.Hint,
          },
          colored = true,
        },
      },
      lualine_c = {'filename'},
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {
        {
          'location',
          color = { bg = '#458588' }
        },
      }
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
  }
}
