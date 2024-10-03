vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.guicursor = ""
vim.opt.cursorline = true

vim.opt.mouse = "a"
vim.opt.background = "dark"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.linebreak = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.clipboard = "unnamedplus"

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.smoothscroll = true
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.autoread = true
vim.opt.conceallevel = 0

vim.opt.completeopt = "menu,menuone,noselect"
