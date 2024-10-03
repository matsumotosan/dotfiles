return {
	"tpope/vim-fugitive",
	lazy = false,
	opts = {},
	config = function()
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
		vim.keymap.set("n", "<leader>gd", "<cmd>Git diff<CR>")
		vim.keymap.set("n", "gh", "<cmd>diffget //2<CR>")
		vim.keymap.set("n", "gl", "<cmd>diffget //3<CR>")
	end,
}
