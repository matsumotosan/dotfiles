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

       lsp.on_attach(function(_, bufnr)
         local function map(mode, lhs, rhs)
           vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
         end

         map('n', 'gd', vim.lsp.buf.definition)
         map('n', 'gD', vim.lsp.buf.declaration)
         map('n', 'gi', vim.lsp.buf.implementation)
         map('n', 'gR', vim.lsp.buf.references)

         map('n', 'gr', require('telescope.builtin').lsp_references)
         map('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols)
         map('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols)

         map('n', 'K', vim.lsp.buf.hover)
         map({ 'n', 'i' }, '<C-s>', vim.lsp.buf.signature_help)
         map('n', '<leader>vca', vim.lsp.buf.code_action)
         map('n', '<leader>vrn', vim.lsp.buf.rename)

         map('n', '<leader>li', vim.lsp.buf.incoming_calls)
         map('n', '<leader>lo', vim.lsp.buf.outgoing_calls)
         map('n', '<leader>lt', vim.lsp.buf.document_symbol)

         map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder)
         map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder)
         map('n', '<leader>wl', function()
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

      lsp.ensure_installed({
         'jedi_language_server',
         'lua_ls',
       })

       lsp.setup()
     end
   }
 }
