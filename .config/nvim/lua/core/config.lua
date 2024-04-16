vim.g.mapleader = " "
vim.g.starry_italic_comments = true
vim.g.skip_ts_context_commentstring_module = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.foldcolumn = "0"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.wo.number = true
vim.opt.swapfile = false
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.termguicolors = true
vim.opt.expandtab = true
vim.opt.laststatus = 0
vim.opt.cmdheight = 1
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.updatetime = 100
vim.opt.signcolumn = "yes:1"
vim.opt.clipboard = "unnamedplus"
vim.opt.langmap =
	"ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"

_G.HOME = vim.fn.expand("~")
