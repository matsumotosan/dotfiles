return {
	"Wansmer/treesj",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	opts = {
		max_join_length = 100,
	},
	keys = {
		{ "<leader>m", '<cmd>lua require("treesj").toggle()<CR>', desc = "Toggle TreeSJ" },
		{
			"<leader>M",
			'<cmd>lua require("treesj").toggle({split = {recursive = true}})<CR>',
			desc = "Toggle TreeSJ recursively",
		},
	},
}
