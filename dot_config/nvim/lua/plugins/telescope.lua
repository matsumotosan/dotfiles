return {
  {
    'nvim-telescope/telescope.nvim',
    version = false,
    lazy = true,
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = 'Telescope',
    keys = {
      -- search
      { '<C-p>', '<cmd>Telescope git_files<cr>', desc = 'Search files tracked by Git' },
      { '<leader>pf', '<cmd>Telescope find_files<cr>', desc = 'Find files' },
      { '<leader>pr', '<cmd>Telescope oldfiles<cr>', desc = 'Search recently opened files' },
      { '<leader>pb', '<cmd>Telescope buffers<cr>', desc = 'Search buffers' },
      { '<leader>ph', '<cmd>Telescope help_tags<cr>', desc = 'Search help' },
      { '<leader>ps', '<cmd>Telescope grep_string<cr>', desc = 'Search word' },
      { '<leader>pg', '<cmd>Telescope live_grep<cr>', desc = 'Search by grep' },
      { '<leader>pd', '<cmd>Telescope diagnostics<cr>', desc = 'Search diagnostics' },
      { '<leader>pcb', '<cmd>Telescope current_buffer_fuzzy_find<cr>', desc = 'Search current buffer' },

      -- git
      { "<leader>sgc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
      { "<leader>sgs", "<cmd>Telescope git_status<CR>", desc = "status" },
    },
    config = function()
      require('telescope').setup{
        defaults = {},
        pickers = {
          find_files = {'dropdown'},
        },
        extensions = {},
      }
    end,
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },
}
