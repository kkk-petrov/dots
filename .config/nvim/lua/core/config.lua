local opt = vim.opt

vim.g.mapleader = " "
vim.wo.number = true
opt.swapfile = false
opt.relativenumber = true
opt.termguicolors = true
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.laststatus = 0
opt.clipboard = "unnamedplus"
opt.langmap =
	"ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"

-- Highlights
vim.cmd([[
  hi FileExplorer gui=bold,italic guibg=#151523
  hi NeoTreeNormal guibg=#151523
  hi NeoTreeNormalNC guibg=#151523
  hi NeoTreeWinSeparator guibg=#151523 guifg=#151523
  hi NeoTreeVertSplit guibg=#151523 guifg=#151523
  hi NeoTreeStatusLine guibg=#151523 guifg=#151523
  hi NeoTreeEndOfBuffer guibg=#151523 guifg=#151523
  hi NeoTreeEndOfBuffer guibg=#151523 guifg=#151523
]])
