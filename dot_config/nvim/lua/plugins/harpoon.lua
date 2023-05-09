return {
  'ThePrimeagen/harpoon',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { "<leader>ha", '<cmd>lua require("harpoon.mark").add_file()<CR>', desc = "Add file (Harpoon)" },
    { "<leader>ht", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', desc = "Toggle quick menu (Harpoon)" },
    { "<leader>hn", '<cmd>lua require("harpoon.ui").nav_next()<CR>', desc = "Navigate next (Harpoon)" },
    { "<leader>hp", '<cmd>lua require("harpoon.ui").nav_prev()<CR>', desc = "Navigate previous (Harpoon)" },
    -- { "<C-h>", '<cmd>lua require("harpoon.ui").nav_file(1)<CR>', desc = "Navigate to file 1 (Harpoon)" },
    -- { "<C-j>", '<cmd>lua require("harpoon.ui").nav_file(2)<CR>', desc = "Navigate to file 2 (Harpoon)" },
    -- { "<C-k>", '<cmd>lua require("harpoon.ui").nav_file(3)<CR>', desc = "Navigate to file 3 (Harpoon)" },
    -- { "<C-l>", '<cmd>lua require("harpoon.ui").nav_file(4)<CR>', desc = "Navigate to file 4 (Harpoon)" },
  },
}
