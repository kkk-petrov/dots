return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"stevearc/dressing.nvim",
		"nvim-neotest/nvim-nio",
	},
	opts = {
		layouts = {
			{
				elements = {
					{
						id = "repl",
						size = 0.4,
					},
					{
						id = "scopes",
						size = 0.6,
					},
				},
				position = "bottom",
				size = 10,
			},
		},
		floating = {
			border = "rounded",
			mappings = {
				close = { "q", "<Esc>" },
			},
		},
	},
}
