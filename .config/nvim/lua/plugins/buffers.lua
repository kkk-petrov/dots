return {
	-- "romgrk/barbar.nvim",
	-- dependencies = {
	-- 	"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
	-- 	"nvim-tree/nvim-web-devicons",
	-- },
	-- init = function()
	-- 	vim.g.barbar_auto_setup = false
	-- end,
	-- opts = function() end,
	-- config = {
	-- 	sidebar_filetypes = {
	-- 		-- Use the default values: {event = 'BufWinLeave', text = nil}
	-- 		NvimTree = true,
	-- 		-- Or, specify the text used for the offset:
	-- 		undotree = { text = "undotree" },
	-- 		-- Or, specify the event which the sidebar executes when leaving:
	-- 		["neo-tree"] = { event = "BufWipeout" },
	-- 		-- Or, specify both
	-- 		Outline = { event = "BufWinLeave", text = "symbols-outline" },
	-- 	},
	-- 	theme = "catppuccin",
	-- },

	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function(opts)
			require("bufferline").setup({
				options = {

					hover = {
						enabled = true,
						delay = 200,
						reveal = { "close" },
					},

					offsets = {
						{
							filetype = "neo-tree",
							text = "Explorer",
							highlight = "Directory",
							separator = false, -- use a "true" to enable the default, or set your own character
						},
					},
				},
			})
		end,
	},
}
