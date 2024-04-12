local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
	pattern = { "NvimTree", "neo-tree" },
	callback = function()
		require("ufo").detach()
		vim.opt_local.foldenable = false
		vim.wo.foldcolumn = "0"
	end,
})

autocmd("FileType", {
	pattern = { "help" },
	command = "wincmd L",
})
