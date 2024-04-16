return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"microsoft/vscode-js-debug",
			"mxsdev/nvim-dap-vscode-js",
		},
		config = function()
			require("plugins.coding.dap.config.js")
			local colors = require("utils.ui").colors
			local define_signs = require("utils").define_signs
			local define_highlights = require("utils").define_highlights

			local highlights = {
				DapBreakpoint = { ctermbg = 0, fg = colors.red, bg = colors.bg },
				DapLogPoint = { ctermbg = 0, fg = colors.blue, bg = colors.bg },
				DapStopped = { ctermbg = 0, fg = colors.magenta, bg = colors.bg },
				DapStoppedLine = { ctermbg = 0, fg = "", bg = colors.magenta_dark },
			}

			local signs = {
				DapBreakpoint = { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "DapBreakpoint" },
				DapBreakpointCondition = {
					text = "●",
					texthl = "DapBreakpointCondition",
					linehl = "",
					numhl = "DapBreakpoint",
				},
				DapLogPoint = { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "DapLogPoint" },
				DapStopped = { text = "➜", texthl = "DapStopped", linehl = "DapStoppedLine", numhl = "DapStopped" },
			}

			define_highlights(highlights)
			define_signs(signs)
		end,
	},
}
