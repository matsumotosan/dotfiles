local keymap = vim.keymap

-- Remaps for dealing with word wrap
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
keymap.set("n", "0", "v:count == 0 ? 'g0' : '0'", { expr = true, silent = true })
keymap.set("n", "$", "v:count == 0 ? 'g$' : '$'", { expr = true, silent = true })

-- Move blocks of code
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Join line below
keymap.set("n", "J", "mzJ`z")

-- Insert line above/below
keymap.set("n", "<CR>", "moo<esc>`o")
keymap.set("n", "<S-CR>", "moO<esc>`o")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Navigate without moving cursor
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- System clipboard
keymap.set({ "n", "v" }, "<leader>p", [["_dP]])
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [[\"+Y]])
keymap.set({ "n", "v" }, "<leader>D", [["_d]])

-- end of the world
keymap.set("n", "Q", "<nop>")

-- Replace current word
keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Clear search with <esc>
keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- better indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- where am i?
-- keymap.set("v", "y", "ygv<esc>")

-- yank to end
keymap.set("n", "Y", "y$<CR>")

-- sort visual block
keymap.set("v", "<C-s>", ":sort<CR>")

-- previews and tags
keymap.set("n", "<C-w>t", "<C-w>]")
keymap.set("n", "<C-w>p", "<C-w>}")

-- tabs
keymap.set("n", "<C-t>t", "<cmd>tabnew<cr>", { desc = "New Tab" })
keymap.set("n", "<C-t>n", "<cmd>tabnext<cr>", { desc = "Next Tab" })
keymap.set("n", "<C-t>p", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
keymap.set("n", "<C-t>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
keymap.set("n", "<C-t>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
keymap.set("n", "<C-t>c", "<cmd>tabclose<cr>", { desc = "Close Tab" })
keymap.set("n", "<C-t>o", "<cmd>tabonly<cr>", { desc = "Close All Other Tabs" })

keymap.set("n", "gf", function()
  if require("obsidian").util.cursor_on_markdown_link() then
    return "<cmd>ObsidianFollowLink<CR>"
  else
    return "gf"
  end
end, { noremap = false, expr = true })

-- sourcing
vim.keymap.set("n", "<leader><leader>n", function()
	vim.cmd("so")
end)

vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/snippets/python.lua<CR>")
