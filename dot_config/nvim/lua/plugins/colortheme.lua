return {
   priority = 1000,
   "sainnhe/gruvbox-material",
   lazy = false,
   config = function()
      vim.g.gruvbox_material_transparent_background = 0 -- must be 0 to work with vim-illuminate grey background
      vim.g.gruvbox_material_enable_bold = 0
      vim.g.gruvbox_material_foreground = "material"
      vim.g.gruvbox_material_background = "soft"
      vim.g.gruvbox_material_ui_contrast = "low"
      vim.g.gruvbox_material_float_style = "dim"
      vim.g.gruvbox_material_visual = "grey background"
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvgox_material_current_word = "grey background"
      vim.cmd.colorscheme("gruvbox-material")
   end,
}
