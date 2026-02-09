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
				"ruff",
				"rust_analyzer",
				"texlab",
				"tinymist",
				"typos_lsp",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		cmd = "LspInfo",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "saghen/blink.cmp" },
		},
		opts = {
			inlay_hints = { enabled = true },
			document_highlight = { enabled = true },
		},
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local builtin = require("telescope.builtin")

			vim.lsp.enable({
				"basedpyright",
				"bashls",
				"clangd",
				"cmake",
				"lua_ls",
				"marksman",
				"ruff",
				"rust_analyzer",
				"texlab",
				"tinymist",
				"typos_lsp",
			})

			-- https://github.com/DetachHead/basedpyright/issues/380#issuecomment-2254919376
			vim.lsp.config("basedpyright", {
				capabilities = capabilities,
				settings = {
					basedpyright = {
						analysis = {
							autoSearchPaths = true,
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

			vim.lsp.config("asm_lsp", { capabilities = capabilities })
			vim.lsp.config("bashls", { capabilities = capabilities })
			vim.lsp.config("clangd", { capabilities = capabilities })
			vim.lsp.config("cmake", { capabilities = capabilities })
			vim.lsp.config("lua_ls", { capabilities = capabilities })
			vim.lsp.config("marksman", { capabilities = capabilities })
			vim.lsp.config("ruff", { capabilities = capabilities })
			vim.lsp.config("rust_analyzer", { capabilities = capabilities })
			vim.lsp.config("texlab", { capabilities = capabilities })
			vim.lsp.config("tinymist", { capabilities = capabilities })
			vim.lsp.config("typos_lsp", { capabilities = capabilities })

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local opts = { buffer = ev.buf }

					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					-- vim.keymap.set("n", "gd", vim.lsp.buf.definition)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
					-- vim.keymap.set("n", "gr", vim.lsp.buf.references)
					vim.keymap.set("n", "gc", vim.lsp.buf.code_action, opts)

					vim.keymap.set("n", "gd", builtin.lsp_definitions)
					vim.keymap.set("n", "gr", builtin.lsp_references)
					vim.keymap.set("n", "gt", builtin.lsp_type_definitions)
					vim.keymap.set("n", "gO", builtin.lsp_outgoing_calls)
					vim.keymap.set("n", "gI", builtin.lsp_incoming_calls)

					vim.keymap.set({ "n", "i" }, "<C-s>", vim.lsp.buf.signature_help, opts)
					vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
					vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
					vim.keymap.set("n", "<leader>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, opts)
					vim.keymap.set("n", "<leader>vr", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<leader>f", function()
						vim.lsp.buf.format({ async = true })
					end, opts)

					vim.keymap.set({ "n", "i" }, "<C-p>", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
					end)

					vim.keymap.set("n", "gs", "<cmd>ClangdSwitchSourceHeader<CR>")

					vim.keymap.set("n", "<leader>vd", builtin.lsp_document_symbols)
					vim.keymap.set("n", "<leader>vw", builtin.lsp_workspace_symbols)

					vim.keymap.set("n", "<leader>vq", builtin.quickfix)
					vim.keymap.set("n", "<leader>vl", builtin.loclist)
					vim.keymap.set("n", "<leader>vj", builtin.jumplist)

					vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
					vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

					vim.keymap.set("n", "gm", builtin.man_pages)
				end,
			})

			vim.diagnostic.config({
				underline = true,
				virtual_text = true,
				virtual_lines = false,
				severity_sort = true,
				update_in_insert = false,
				float = {
					source = true,
					border = "rounded",
				},
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "",
						[vim.diagnostic.severity.WARN] = "",
						[vim.diagnostic.severity.INFO] = "",
						[vim.diagnostic.severity.HINT] = "",
					},
					numhl = {
						[vim.diagnostic.severity.ERROR] = "DiagnosticError",
						[vim.diagnostic.severity.WARN] = "DiagnosticWarn",
						[vim.diagnostic.severity.INFO] = "DiagnosticInfo",
						[vim.diagnostic.severity.HINT] = "DiagnosticHint",
					},
				},
			})
		end,
	},
}
