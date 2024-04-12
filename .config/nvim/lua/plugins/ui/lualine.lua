local colors = {
	bg = "#1E1E2E",
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
}

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
	lsp_not_empty = function()
		local clients = vim.lsp.get_active_clients()
		if next(clients) == nil then
			return false
		end
		return true
	end,
}

local function get_cwd()
	return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
end

local function get_file_icon(filename)
	local icons = require("nvim-web-devicons")
	return icons.get_icon(filename, vim.fn.fnamemodify(filename, ":e"), { defaults = "true" })
end

local function get_lsp()
	local msg = "LSP"
	local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
	local clients = vim.lsp.get_active_clients()
	if next(clients) == nil then
		return msg
	end
	for _, client in ipairs(clients) do
		local filetypes = client.config.filetypes
		if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
			return client.name
		end
	end
	return msg
end

-- Components
local mode = {
	"mode",
	padding = { left = 2, right = 1 },
	color = { gui = "bold" },
	separator = { right = "" },
	icon = "",
}

local progress = {
	"progress",
	padding = { left = 1, right = 0 },
	color = { fg = colors.fg },
}

local location = {
	"location",
	padding = { left = 1, right = 0 },
}

local lsp = {
	get_lsp,
	icon = "",
	padding = 1,
	cond = conditions.lsp_not_empty,
	color = { fg = colors.violet },
}

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	symbols = { error = " ", warn = " ", hint = " ", info = " " },
	diagnostics_color = {
		color_error = { fg = colors.red },
		color_warn = { fg = colors.yellow },
		color_hint = { fg = colors.green },
		color_info = { fg = colors.cyan },
	},
	padding = { left = 2 },
	separator = { right = "", left = "" },
}

local filename = {
	"filename",
	cond = conditions.buffer_not_empty,
	icon = get_file_icon(vim.fn.expand("%:t")),
}

local cwd = {
	get_cwd,
	icon = "󰉖",
	separator = { left = "" },
	padding = { left = 1, right = 2 },
}

local branch = {
	"branch",
	icon = "",
	color = { fg = colors.violet, gui = "bold" },
	padding = { left = 1, right = 1 },
}

local diff = {
	"diff",
	symbols = { added = " ", modified = " ", removed = " " },
	diff_color = {
		added = { fg = colors.green },
		modified = { fg = colors.magenta },
		removed = { fg = colors.red },
	},
	cond = conditions.hide_in_width,
}

local config = {
	options = {
		component_separators = "",
		section_separators = { left = "", right = "" },
		theme = {
			normal = {
				a = { fg = colors.bg, bg = colors.violet },
				c = { fg = colors.fg, bg = colors.bg },
				x = { fg = colors.fg, bg = colors.bg },
				y = { fg = colors.bg, bg = colors.red },
				z = { fg = colors.bg, bg = colors.yellow },
			},
			insert = {
				a = { fg = colors.bg, bg = colors.red },
				y = { fg = colors.bg, bg = colors.red },
				z = { fg = colors.bg, bg = colors.yellow },
			},
			visual = {
				a = { fg = colors.bg, bg = colors.blue },
				y = { fg = colors.bg, bg = colors.red },
				z = { fg = colors.bg, bg = colors.yellow },
			},
			replace = {
				a = { fg = colors.bg, bg = colors.red },
				y = { fg = colors.bg, bg = colors.red },
				z = { fg = colors.bg, bg = colors.yellow },
			},
			command = {
				a = { fg = colors.bg, bg = colors.yellow },
				y = { fg = colors.bg, bg = colors.red },
				z = { fg = colors.bg, bg = colors.yellow },
			},
		},
		disabled_filetypes = { "Lazy", "Mason", "neo-tree", "NvimTree" },
	},
	sections = {
		lualine_a = {
			mode,
		},
		lualine_b = {
			diagnostics,
		},
		lualine_c = {},
		lualine_x = {
			diff,
			branch,
		},
		lualine_y = {
			filename,
		},
		lualine_z = {
			cwd,
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
}

return {
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup(config)
		end,
	},
}
