return {
  {
    'nvim-telescope/telescope.nvim',
    version = false,
    lazy = true,
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
      },
      'nvim-telescope/telescope-ui-select.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
    },
    cmd = 'Telescope',
    keys = {
      -- file pickers
      { '<C-f>', '<cmd>Telescope find_files<cr>', desc = 'Find files' },
      { '<leader>ft', '<cmd>Telescope git_files<cr>', desc = 'Search files tracked by Git' },
      { '<leader>fs', '<cmd>Telescope grep_string<cr>', desc = 'Search word' },
      { '<leader>fl', '<cmd>Telescope live_grep<cr>', desc = 'Search by grep' },

      -- vim pickers
      { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Search buffers' },
      { '<leader>fr', '<cmd>Telescope oldfiles<cr>', desc = 'Search recently opened files' },
      { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Search help' },
      { '<leader>fd', '<cmd>Telescope diagnostics<cr>', desc = 'Search diagnostics' },
      { '<leader>fc', '<cmd>Telescope current_buffer_fuzzy_find<cr>', desc = 'Search current buffer' },

      -- git
      { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "List current changes" },
      { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "List git commits" },
      { "<leader>gf", "<cmd>Telescope git_bcommits<CR>", desc = "List buffer's git commits" },
      { "<leader>gb", "<cmd>Telescope git_branches<CR>", desc = "List git branches" },
      { "<leader>gh", "<cmd>Telescope git_stash<CR>", desc = "List git stash" },

      -- treesitter
      { "<leader>ts", "<cmd>Telescope treesitter<CR>", desc = "Treesitter" },

      -- file browser
      { "<leader>ff", "<cmd>Telescope file_browser<CR>", desc = "Open file browser" },
    },
    config = function()
      local telescope = require('telescope')
      local icons = require "config.icons"

      telescope.setup({
        defaults = {
          theme = "dropdown",
          previewer = true,
          initial_mode = 'insert',
          sorting_strategy = 'ascending',
          prompt_prefix = icons.misc.Telescope,
          selection_caret = icons.misc.Comet,
          layout_config = {
            prompt_position = 'top',
          },
          dynamic_preview_title = true,
          path_display = 'smart',
          winblend = 0,
          border = {},
          borderchars = nil,
          color_devicons = true,
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
          ['ui-select'] = {
            require('telescope.themes').get_dropdown({
              previewer = true,
              initial_mode = 'normal',
              sorting_strategy = 'ascending',
            })
          },
          file_browser = {
            theme = 'dropdown',
            hijack_netrw = true,
          }
        },
      })
      telescope.load_extension('fzf')
      telescope.load_extension('ui-select')
      telescope.load_extension('file_browser')
    end,
  },
}
