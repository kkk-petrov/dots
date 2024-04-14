local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
	pattern = { "NvimTree", "neo-tree" },
	callback = function()
		require("ufo").detach()
		vim.opt_local.foldenable = false
		vim.wo.foldcolumn = "0"
	end,
})

autocmd({ "BufEnter", "BufWinEnter" }, {
	group = vim.api.nvim_create_augroup("DisableInsertMode", {}),
	pattern = "?*",
	callback = function(ev)
		local filename = vim.fn.fnamemodify(ev.file, ":t")
		local dap_repl = "[dap-repl]"
		if filename and (filename:sub(1, 3) == "DAP" or filename:sub(1, #dap_repl) == dap_repl) then
			return
		end
		vim.cmd("silent! stopinsert")
	end,
})

autocmd("BufWinEnter", {
	group = vim.api.nvim_create_augroup("help_window", {}),
	pattern = { "*.txt" },
	callback = function()
		if vim.o.filetype == "help" then
			vim.cmd.wincmd("L")
		end
	end,
})
