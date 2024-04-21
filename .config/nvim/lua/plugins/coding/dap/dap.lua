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
		end,
	},
}
