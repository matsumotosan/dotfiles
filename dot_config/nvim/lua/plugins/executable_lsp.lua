return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    lazy = false,
    config = function()
      require('lsp-zero.settings').preset({})
    end
  },

  {
    'neovim/nvim-lspconfig',
    cmd = 'LspInfo',
    event = {'BufReadPre', 'BufNewFile'},
    dependencies = {
      {'folke/neodev.nvim', opts = {} },
      {'hrsh7th/cmp-nvim-lsp'},
      {'williamboman/mason-lspconfig.nvim'},
      {
        'williamboman/mason.nvim',
        build = ':MasonUpdate',
      },
    },
    config = function()
      local lsp = require('lsp-zero')
      local icons = require('config.icons')

      lsp.on_attach(function(client, bufnr)
        local builtin = require('telescope.builtin')
        local function map(mode, lhs, rhs)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
        end

        map('n', 'gd', builtin.lsp_definitions)
        map('n', 'gi', builtin.lsp_implementations)
        map('n', 'gr', builtin.lsp_references)
        map('n', 'gD', vim.lsp.buf.declaration)
        map('n', 'K', vim.lsp.buf.hover)
        map({ 'n', 'i' }, '<C-s>', vim.lsp.buf.signature_help)

        map('n', '<leader>vds', builtin.lsp_document_symbols)
        map('n', '<leader>vws', builtin.lsp_dynamic_workspace_symbols)
        map('n', '<leader>vli', builtin.lsp_incoming_calls)
        map('n', '<leader>vlo', builtin.lsp_outgoing_calls)

        map('n', '<leader>vca', vim.lsp.buf.code_action)
        map('n', '<leader>vrn', vim.lsp.buf.rename)

        map('n', '<leader>vwa', vim.lsp.buf.add_workspace_folder)
        map('n', '<leader>vwr', vim.lsp.buf.remove_workspace_folder)
        map('n', '<leader>vwl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end)

        map('n', '<leader>vd', vim.diagnostic.open_float)
        map('n', '<leader>vl', vim.diagnostic.setloclist)
        map('n', '[d', vim.diagnostic.goto_next)
        map('n', ']d', vim.diagnostic.goto_prev)

        vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
          vim.lsp.buf.format()
        end, { desc = 'Format current buffer with LSP' })
      end)

      lsp.set_sign_icons({
        error = icons.diagnostics.BoldError,
        warn = icons.diagnostics.BoldWarning,
        hint = icons.diagnostics.BoldHint,
        info = icons.diagnostics.BoldInformation
      })

      lsp.ensure_installed({
        'pyright',
        'jedi_language_server',
        'lua_ls',
      })

      lsp.setup()
    end
  }
}
