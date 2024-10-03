return {
    "cbochs/grapple.nvim",
    opts = {
        scope = "git", -- also try out "git_branch"
    },
    event = { "BufReadPost", "BufNewFile" },
    cmd = "Grapple",
    keys = {
        { "<leader>a", "<cmd>Grapple toggle<cr>", desc = "Grapple toggle tag" },
	{ "<C-space>", "<cmd>Grapple toggle_tags<cr>", desc = "Grapple toggle tags" },
        { "<C-h>", "<cmd>Grapple select index=1<cr>", desc = "Grapple select 1" },
        { "<C-j>", "<cmd>Grapple select index=2<cr>", desc = "Grapple select 2" },
        { "<C-k>", "<cmd>Grapple select index=3<cr>", desc = "Grapple select 3" },
        { "<C-l>", "<cmd>Grapple select index=4<cr>", desc = "Grapple select 4" },
    },
}
