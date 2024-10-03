return {
	"nvimtools/none-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.code_actions.gitsigns,
				null_ls.builtins.code_actions.proselint,
				null_ls.builtins.code_actions.refactoring,

				null_ls.builtins.completion.luasnip,
				null_ls.builtins.completion.spell,
				null_ls.builtins.completion.tags,

				null_ls.builtins.diagnostics.codespell,
				null_ls.builtins.diagnostics.fish,
				null_ls.builtins.diagnostics.proselint,
				null_ls.builtins.diagnostics.markdownlint,
				null_ls.builtins.diagnostics.staticcheck,

				null_ls.builtins.formatting.clang_format,
				null_ls.builtins.formatting.codespell,
				null_ls.builtins.formatting.fish_indent,
				null_ls.builtins.formatting.markdownlint,
				null_ls.builtins.formatting.shfmt,
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.typstyle,
				null_ls.builtins.formatting.yamlfmt,
			},
		})
	end,
}
