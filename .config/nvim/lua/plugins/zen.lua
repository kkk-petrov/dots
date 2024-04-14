return {
	"folke/zen-mode.nvim",
	config = function()
		require("zen-mode").setup({
			window = {
				backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
				width = 0.8, -- width of the Zen window
				height = 1, -- height of the Zen window
			},
			plugins = {
				options = {
					enabled = true,
					ruler = false, -- disables the ruler text in the cmd line area
					showcmd = false, -- disables the command in the last line of the screen
				},
				twilight = { enabled = false }, -- enable to start Twilight when zen mode opens
				gitsigns = { enabled = true }, -- disables git signs
			},
			-- callback where you can add custom code when the Zen window opens
			on_open = function()
				require("gitsigns.actions").toggle_current_line_blame()
				vim.opt.relativenumber = false
				vim.opt.signcolumn = "no"
				vim.o.foldcolumn = "0"
				require("gitsigns.actions").refresh()
			end,
			-- callback where you can add custom code when the Zen window closes
			on_close = function()
				require("gitsigns.actions").toggle_current_line_blame()
				vim.opt.relativenumber = true
				vim.opt.signcolumn = "yes:1"
				vim.o.foldcolumn = "1"
				require("gitsigns.actions").refresh()
			end,
		})
	end,
}
