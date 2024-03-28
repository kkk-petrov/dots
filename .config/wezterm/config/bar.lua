local colors = {
	bg = "#151523",
	active = "#1e1e2e",
	inactive = "#151526",
	hover = "#282835",
	fg = "#99AEB3",
}

local module = {}

function module.apply(config)
	config.window_frame = {
		inactive_titlebar_bg = colors.bg,
		active_titlebar_bg = colors.bg,
		inactive_titlebar_fg = "#cccccc",
		active_titlebar_fg = "#ffffff",
		inactive_titlebar_border_bottom = "#ffffff",
		active_titlebar_border_bottom = "#ffffff",
		button_fg = colors.fg,
		button_bg = colors.bg,
		button_hover_fg = "#ffffff",
		button_hover_bg = "#3b3052",
		font_size = 12,
	}

	config.colors = {
		tab_bar = {
			background = colors.bg,
			inactive_tab_edge = colors.active,
			inactive_tab = {
				bg_color = colors.inactive,
				fg_color = colors.fg,
			},
			inactive_tab_hover = {
				bg_color = colors.active,
				fg_color = colors.fg,
			},
			active_tab = {
				bg_color = colors.active,
				fg_color = colors.fg,
			},
		},
	}
end

return module
