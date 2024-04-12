local highlights = {
	fill = {
		bg = "#151523",
	},
	background = {
		bg = "#151523",
	},
	buffer_visible = {
		bg = "#151523",
	},
	buffer_selected = {
		bg = "#151523",
		fg = "#BC9FE0",
	},
	separator_selected = {
		bg = "#151523",
	},
	separator_visible = {
		bg = "#151523",
	},
	separator = {
		bg = "#151523",
	},
	indicator_visible = {
		bg = "#151523",
	},
	indicator_selected = {
		bg = "#151523",
	},
	modified = {
		bg = "#151523",
	},
	modified_visible = {
		bg = "#151523",
	},
	modified_selected = {
		bg = "#151523",
	},
	offset_separator = {
		bg = "#151523",
	},
}

return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		after = "catppuccin",
		config = function()
			local bufferline = require("bufferline")
			bufferline.setup({
				options = {
					style_preset = bufferline.style_preset.minimal,
					themable = true,
					separator_style = "thin",
					show_buffer_icons = true,
					show_buffer_close_icons = false,
					show_close_icon = false,
					show_tab_indicators = false,
					modified_icon = "󰨐",
					indicator = {
						style = "none",
					},
					offsets = {
						{
							filetype = "neo-tree",
							text = "Explorer",
							highlight = "FileExplorer",
							separator = true,
						},
						{
							filetype = "NvimTree",
							text = "Explorer",
							highlight = "FileExplorer",
							separator = true,
						},
					},
				},
				highlights = highlights,
			})
		end,
	},
}
