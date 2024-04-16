local colors = require("utils.ui").colors

local highlights = {
	fill = {
		bg = colors.bg,
	},
	background = {
		bg = colors.bg,
	},
	buffer_visible = {
		bg = colors.bg,
	},
	buffer_selected = {
		bg = colors.bg,
		fg = colors.pink,
	},
	separator_selected = {
		bg = colors.bg,
	},
	separator_visible = {
		bg = colors.bg,
	},
	separator = {
		bg = colors.bg,
	},
	indicator_visible = {
		bg = colors.bg,
	},
	indicator_selected = {
		bg = colors.bg,
	},
	modified = {
		bg = colors.bg,
	},
	modified_visible = {
		bg = colors.bg,
	},
	modified_selected = {
		bg = colors.bg,
	},
	offset_separator = {
		bg = colors.bg,
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
					},
				},
				highlights = highlights,
			})
		end,
	},
}
