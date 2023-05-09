return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    char = "│",
    filetype_exclude = {
      "alpha",
      "checkhealth",
      "dashboard",
      "help",
      "lazy",
      "lspinfo",
      "man",
      "neo-tree",
      "Trouble",
    },
    bufname_exclude = {
      'README.md',
    },
    show_trailing_blankline_indent = false,
    show_current_context = true,
  },
}
