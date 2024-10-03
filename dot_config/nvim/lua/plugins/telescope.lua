return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		lazy = false,
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			{ "debugloop/telescope-undo.nvim" },
		},
		cmd = "Telescope",
		keys = {
			-- file pickers
			{ "<C-f>", "<cmd>lua require('config.telescope-config').project_files()<cr>", desc = "Find files" },
			{ "<C-g>", "<cmd>Telescope live_grep<cr>", desc = "Search by grep" },
			{ "<leader>sw", "<cmd>Telescope grep_string<cr>", desc = "Search word" },

			-- vim pickers
			{
				"<leader>sb",
				"<cmd>Telescope buffers<cr>",
				desc = "Search buffers",
			},
			{
				"<leader>sr",
				"<cmd>Telescope oldfiles<cr>",
				desc = "Search recently opened files",
			},
			{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Search help" },
			{
				"<leader>sd",
				"<cmd>Telescope diagnostics<cr>",
				desc = "Search diagnostics",
			},
			{
				"<leader>sc",
				"<cmd>Telescope current_buffer_fuzzy_find<cr>",
				desc = "Search current buffer",
			},

			-- undo
			{
				"<leader>su",
				"<cmd>Telescope undo<CR>",
				desc = "Search undo history",
			},
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local icons = require("config.icons")

			telescope.setup({
				defaults = {
					theme = "dropdown",
					previewer = true,
					initial_mode = "insert",
					sorting_strategy = "ascending",
					prompt_prefix = icons.misc.MagnifyingGlass,
					selection_caret = "  ",
					entry_prefix = "  ",
					layout_config = {
						prompt_position = "top",
						-- preview_width = 0.5,
						-- results_width = 0.8,
					},
					dynamic_preview_title = true,
					-- path_display = "smart",
					winblend = 0,
					border = {},
					borderchars = nil,
					color_devicons = true,
					mappings = {
						i = {
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
						},
						n = {
							["<esc>"] = actions.close,
						},
					},
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
					undo = {
						mappings = {
							i = {
								["<cr>"] = require("telescope-undo.actions").restore,
								["<S-cr>"] = require("telescope-undo.actions").yank_additions,
								["<C-cr>"] = require("telescope-undo.actions").yank_deletions,
							},
							n = {
								["<cr>"] = require("telescope-undo.actions").restore,
								["<S-cr>"] = require("telescope-undo.actions").yank_additions,
								["<C-cr>"] = require("telescope-undo.actions").yank_deletions,
							},
						},
					},
				},
			})

			telescope.load_extension("fzf")
			telescope.load_extension("undo")
			-- telescope.load_extension("harpoon")
			telescope.load_extension("ui-select")
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
