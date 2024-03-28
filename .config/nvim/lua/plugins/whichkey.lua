return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		local wk = require("which-key")
		local builtin = require("telescope.builtin")
		local trouble = require("trouble")
		local opts = { noremap = true, silent = true }

		wk.register({
			c = {
				name = "code",
			},
			f = {
				name = "file",
				f = { builtin.find_files, "Find files", opts },
				n = { "<cmd>enew<cr>", "New file", opts },
			},
			x = {
				name = "diagnostics",
				x = {
					function()
						trouble.toggle()
					end,
					"File diagnostics",
					noremap = true,
					silent = true,
				},
				w = {
					function()
						trouble.toggle("workspace_diagnostics")
					end,
					"Workspace diagnostics",
					noremap = true,
					silent = true,
				},
				d = {
					function()
						trouble.toggle("document_diagnostics")
					end,
					"Document diagnostics",
					noremap = true,
					silent = true,
				},
				q = {
					function()
						trouble.toggle("quickfix")
					end,
					"Quick fix",
					noremap = true,
					silent = true,
				},
				l = {
					function()
						trouble.toggle("loclist")
					end,
					"Location list",
					noremap = true,
					silent = true,
				},
			},
			b = {
				name = "buffers",
				b = { "<Cmd>BufferLineCyclePrev<CR>", "Move to previous buffer", opts },
				n = { "<Cmd>BufferLineCycleNext<CR>", "Move to next buffer", opts },
				c = { "<Cmd>BufferLinePickClose<CR>", "Pick buffer to close", opts },
				d = { "<Cmd>bdelete!<CR>", "Close buffer", opts },
			},
		}, { prefix = "<leader>" })
	end,
	opts = {},
}
