return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		local wk = require("which-key")

		wk.setup({
			plugins = { spelling = true },
			icons = {
				breadcrumb = ">",
				separator = "➜",
				group = "$",
			},
			window = {
				border = "none",
				winblend = 0,
			},
			layout = {
				spacing = 3, -- spacing between columns
				align = "center", -- align columns left, center or right
			},
		})

		wk.register({
			c = {
				name = "code",
			},
			d = {
				name = "debug",
			},
			f = {
				name = "explore",
			},
			g = {
				name = "git",
			},
			x = {
				name = "diagnostics",
			},
			b = {
				name = "buffers",
			},
			u = {
				name = "ui",
			},
		}, { prefix = "<leader>" })
	end,
}
