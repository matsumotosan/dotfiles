return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    { 'onsails/lspkind-nvim' },
    { 'L3MON4D3/LuaSnip' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'rafamadriz/friendly-snippets' },
  },
  config = function()
    require('lsp-zero.cmp').extend()
    require('luasnip.loaders.from_vscode').lazy_load()

    local cmp = require('cmp')
    local lspkind = require('lspkind')
    local luasnip = require('luasnip')
    local icons = require('config.icons')

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end
      },

      mapping = cmp.mapping.preset.insert({
        ['<C-n>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
        ['<C-p>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-Space>'] = cmp.mapping.complete(),

        ['<C-y>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        },

        ['<Tab>'] = cmp.mapping(function(fallback)
          if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      }),

      sources = {
        { name = 'nvim_lsp',   keyword_length = 1 },
        { name = 'nvim_lua',   keyword_length = 2 },
        { name = 'buffer',     keyword_length = 2 },
        { name = 'luasnip',    keyword_length = 2 },
        { name = 'path',       keyword_length = 3 },
        { name = 'treesitter', keyword_length = 3 },
      },

      formatting = {
        fields = { 'abbr', 'kind', 'menu' },
        format = function(entry, vim_item)
          vim_item.kind = (icons.kind[vim_item.kind]) .. vim_item.kind
          return vim_item
        end,
      },

      window = {
        documentation = cmp.config.window.bordered(),
      },

      experimental = {
        ghost_text = { hl_group = 'Grey' },
      },
    })
  end
}
