return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		vim.fn.sign_define("DiagnosticSignError", { text = "󰨐", texthl = "DiagnosticSignError" })
		vim.fn.sign_define("DiagnosticSignWarn", { text = "󰨐", texthl = "DiagnosticSignWarn" })
		vim.fn.sign_define("DiagnosticSignInfo", { text = "󰨐", texthl = "DiagnosticSignInfo" })
		vim.fn.sign_define("DiagnosticSignHint", { text = "󰨐", texthl = "DiagnosticSignHint" })

		require("neo-tree").setup({
			enable_git_status = false,
			default_component_configs = {
				modified = {
					symbol = "󰨐",
					highlight = "NeoTreeAdded",
				},
			},
			window = {
				position = "left",
				width = 30,
			},
		})
	end,
}
