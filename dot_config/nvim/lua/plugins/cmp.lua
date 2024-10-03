return {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		{ "Exafunction/codeium.nvim" },
		{ "L3MON4D3/LuaSnip" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-nvim-lsp-signature-help" },
		{ "hrsh7th/cmp-nvim-lua" },
		{ "hrsh7th/cmp-path" },
		{ "saadparwaiz1/cmp_luasnip" },
		-- { "rafamadriz/friendly-snippets" },
		-- { "onsails/lspkind.nvim" },
	},

	config = function()
		require("luasnip.loaders.from_vscode").lazy_load()
		require("luasnip.loaders.from_lua").lazy_load({ paths = { "~/.config/nvim/snippets" } })

		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local codeium = require("codeium")
		local icons = require("config.icons")

		codeium.setup()

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			formatting = {
				format = function(entry, item)
					item.kind = icons.kind[item.kind] .. item.kind
					item.menu = ({
						buffer = "[Buffer]",
						nvim_lsp = "[LSP]",
						luasnip = "[LuaSnip]",
						nvim_lua = "[Lua]",
						latex_symbols = "[LaTeX]",
					})[entry.source.name]
					return item
				end,
			},
			mapping = {
				["<C-j>"] = cmp.mapping(
					cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					{ "i", "c" }
				),
				["<C-k>"] = cmp.mapping(
					cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					{ "i", "c" }
				),
				["<C-c>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
				["<C-y>"] = cmp.mapping(
					cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
					{ "i", "c" }
				),
				["<C-e>"] = cmp.mapping(cmp.mapping.abort(), { "i", "c" }),
				["<C-x>"] = cmp.mapping(cmp.mapping.close(), { "i", "c" }),

				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),

				["<C-l>"] = cmp.mapping(function()
					if luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					end
				end, { "i", "s" }),

				["<C-h>"] = cmp.mapping(function()
					if luasnip.jumpable(-1) then
						luasnip.jump(-1)
					end
				end, { "i", "s" }),

				["<C-n>"] = cmp.mapping(function()
					if luasnip.choice_active() then
						luasnip.change_choice(1)
					end
				end, { "i" }),
			},
			sources = {
				{ name = "nvim_lsp", keyword_length = 2 },
				{ name = "nvim_lsp_signature_help", keyword_length = 2 },
				{ name = "nvim_lua", keyword_length = 2 },
				{ name = "luasnip", keyword_length = 2 },
				{ name = "codeium", keyword_length = 3 },
				{ name = "treesitter", keyword_length = 3 },
				{ name = "buffer", keyword_length = 3 },
				{ name = "path", keyword_length = 3 },
			},
			window = {
				documentation = cmp.config.window.bordered(),
			},
			experimental = {
				ghost_text = true,
			},
		})

		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})
	end,
}
