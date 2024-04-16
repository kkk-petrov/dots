local M = {}

M.colors = {
	bg = "#1E1E2E",
	bg_dark = "#151523",
	fg = "#81869E",
	yellow = "#F1CCCC",
	red = "#EBA0AC",
	green = "#A6E3A1",
	orange = "#FF8800",
	violet = "#a9a1e1",
	magenta = "#c678dd",
	magenta_dark = "#623a75",
	blue = "#89B4FA",
	ltblue = "#B7BDF8",
	pink = "#BC9FE0",
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
