vim.cmd("set termguicolors")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set softtabstop=2")
vim.cmd("set relativenumber")
vim.cmd("set fillchars=eob:~")
vim.cmd("set laststatus=0")
vim.wo.number = true
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local lazy_opts = {
	change_detection = { enabled = false },
}

require("lazy").setup("plugins", lazy_opts)
require("keymaps")
