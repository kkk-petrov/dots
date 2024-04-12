return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"catppuccin/nvim",
		priority = 1000,
		opts = {
			default_integrations = true,
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				fidget = true,
				mason = true,
				neotree = true,
				ufo = true,
				lsp_trouble = true,
				which_key = true,
				illuminate = {
					enabled = true,
					lsp = true,
				},
				mini = {
					enabled = false,
				},
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
					},
					inlay_hints = {
						background = true,
					},
				},
			},
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd("colorscheme catppuccin-mocha")
		end,
	},
	{
		"Verf/deepwhite.nvim",
		lazy = false,
		priority = 1000,
	},
}
