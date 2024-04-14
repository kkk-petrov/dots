return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
		},
		config = function()
			require("plugins.dap.setup.configuration")
			require("plugins.dap.setup.languages")

			local signs = {
				DapBreakpoint = { text = " ", texthl = "black", linehl = "red", numhl = "" },
				DapBreakpointCondition = { text = "󱨇", texthl = "blue", linehl = "", numhl = "" },
				DapBreakpointRejected = { text = "", texthl = "yellow", linehl = "", numhl = "" },
				DapLogPoint = { text = "", texthl = "", linehl = "", numhl = "" },
				DapStopped = { text = "", texthl = "green", linehl = "debugPC", numhl = "" },
			}

			local function try_sign_redefine(name)
				local opts = signs[name]
				vim.fn.sign_define(name, opts)
			end

			for name in pairs(signs) do
				try_sign_redefine(name)
			end
		end,
	},
}
