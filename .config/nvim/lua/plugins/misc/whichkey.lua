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
			plugins = { spelling = true, marks = false, registers = false },
			motions = {
				count = false,
			},
			icons = {
				breadcrumb = ">",
				separator = "➜", --
				group = "$",
			},
			window = {
				border = { "", "─", "", "", "", "", "", "" },
				winblend = 0,
				zindex = 1000,
				margin = { 0, 0, 0, 0 },
				padding = { 1, 2, 1, 8 },
			},
			layout = {
				height = { min = 4 },
				spacing = 3,
				align = "center",
			},

			show_help = false,
			show_keys = false,
		})

		wk.register({
			c = {
				name = "code",
			},
			d = {
				name = "debug",
			},
			f = {
				name = "find",
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
