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
				name = "files",
				f = { builtin.find_files, "Find files", opts },
				n = { "<cmd>enew<cr>", "New file", opts },
				g = { "<cmd>Telescope live_grep<cr>", "Live grep", opts },
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
				d = { ":lua MiniBufremove.delete()<CR>", "Close buffer", opts },
			},
			u = {
				name = "ui",
				h = { "<cmd>ColorizerToggle<CR>", "Toggle colorizer", opts },
				c = { "<cmd>Telescope colorscheme<CR>", "Colorscheme", opts },
			},
		}, { prefix = "<leader>" })
	end,
}
