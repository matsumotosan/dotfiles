return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"asm_lsp",
				"basedpyright",
				"bashls",
				"clangd",
				"cmake",
				"lua_ls",
				"marksman",
				"ruff_lsp",
				"rust_analyzer",
				"texlab",
				"typos_lsp",
				"typst_lsp",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		cmd = "LspInfo",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "folke/neodev.nvim", opts = {} },
		},
		opts = {
			inlay_hints = { enabled = true },
			document_highlight = { enabled = true },
		},
		config = function()
			local icons = require("config.icons")
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local builtin = require("telescope.builtin")

			lspconfig.asm_lsp.setup({ capabilities = capabilities })

			-- https://github.com/DetachHead/basedpyright/issues/380#issuecomment-2254919376
			lspconfig.basedpyright.setup({
				capabilities = capabilities,
				settings = {
					basedpyright = {
						analysis = {
							typeCheckingMode = "standard",
							diagnosticMode = "openFilesOnly",
							diagnosticSeverityOverrides = {
								-- reportAny = false,
								-- reportUnusedCallResult = false,
								-- reportMissingTypeArgument = false,
								-- reportMissingParameterType = false,
								-- reportUnknownArgumentType = false,
								-- reportUnknownLambdaType = false,
								-- reportUnknownParameterType = false,
								-- reportUnknownVariableType = false,
								reportMissingTypeStubs = false,
								reportUnknownMemberType = false,
								reportUnusedImport = false,
							},
						},
					},
				},
			})
			lspconfig.bashls.setup({ capabilities = capabilities })
			lspconfig.clangd.setup({ capabilities = capabilities })
			lspconfig.cmake.setup({ capabilities = capabilities })
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.marksman.setup({ capabilities = capabilities })
			lspconfig.ruff_lsp.setup({ capabilities = capabilities })
			lspconfig.rust_analyzer.setup({ capabilities = capabilities })
			lspconfig.texlab.setup({ capabilities = capabilities })
			lspconfig.typos_lsp.setup({ capabilities = capabilities })
			lspconfig.typst_lsp.setup({ capabilities = capabilities })

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local opts = { buffer = ev.buf }

					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gd", builtin.lsp_definitions)
					vim.keymap.set("n", "gi", builtin.lsp_implementations)
					vim.keymap.set("n", "gr", builtin.lsp_references)
					vim.keymap.set("n", "gt", builtin.lsp_type_definitions)
					vim.keymap.set("n", "gO", builtin.lsp_outgoing_calls)
					vim.keymap.set("n", "gI", builtin.lsp_incoming_calls)

					vim.keymap.set("n", "gs", "<cmd>ClangdSwitchSourceHeader<CR>")

					vim.keymap.set("n", "<leader>vd", builtin.lsp_document_symbols)
					vim.keymap.set("n", "<leader>vw", builtin.lsp_workspace_symbols)

					vim.keymap.set("n", "<leader>vq", builtin.quickfix)
					vim.keymap.set("n", "<leader>vl", builtin.loclist)
					vim.keymap.set("n", "<leader>vj", builtin.jumplist)

					vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
					vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

					vim.keymap.set({ "n", "i" }, "<C-s>", vim.lsp.buf.signature_help, opts)
					vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
					vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
					vim.keymap.set("n", "<leader>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, opts)
					vim.keymap.set("n", "<leader>vr", vim.lsp.buf.rename, opts)
					vim.keymap.set({ "n", "v" }, "<leader>vc", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "<leader>gf", function()
						vim.lsp.buf.format({ async = true })
					end, opts)

					vim.keymap.set({ "n", "i" }, "<C-p>", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
					end)
				end,
			})

			vim.diagnostic.config({
				underline = true,
				virtual_text = true,
				severity_sort = true,
				update_in_insert = true,
				float = {
					border = "rounded",
					source = true,
				},
			})

			local sign = function(opts)
				vim.fn.sign_define(opts.name, {
					texthl = opts.name,
					text = opts.text,
					numhl = "",
				})
			end

			sign({ name = "DiagnosticSignError", text = icons.diagnostics.BoldError })
			sign({ name = "DiagnosticSignWarn", text = icons.diagnostics.BoldWarning })
			sign({ name = "DiagnosticSignHint", text = icons.diagnostics.BoldHint })
			sign({ name = "DiagnosticSignInfo", text = icons.diagnostics.BoldInformation })

			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
			vim.lsp.handlers["textDocument/signatureHelp"] =
				vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
		end,
	},
}
