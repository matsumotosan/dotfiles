return {
	"stevearc/oil.nvim",
	config = function()
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		require("oil").setup({
			default_file_explorer = true,
			keymaps = {
				["<C-h>"] = false,
				["<C-l>"] = false,
				["<C-v>"] = "actions.select_vsplit",
				["<C-s>"] = "actions.select_split",
				["<C-t>"] = "actions.select_tab",
			},
			columns = {
				"icon",
			},
			view_options = {
				show_hidden = true,
			},
		})
	end,
}
