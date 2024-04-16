local M = {}

M.colors = {
	bg = "#1E1E2E",
	bg_dark = "#151523",
	bg_alt = "#313244",
	fg = "#81869E",
	yellow = "#F1CCCC",
	red = "#EBA0AC",
	green = "#A6E3A1",
	orange = "#FF8800",
	violet = "#a9a1e1",
	magenta = "#c678dd",
	blue = "#89B4FA",
	ltblue = "#B7BDF8",
	pink = "#BC9FE0",
	gray = "#6c7086",
}

M.icons = {
	git = {
		added = " ",
		modified = " ",
		removed = " ",
	},
	shapes = {
		circle = {
			large = " ",
			-- ...
		},
	},
	separators = {
		rounded = {
			left = "",
			right = "",
		},
	},
}

return M
