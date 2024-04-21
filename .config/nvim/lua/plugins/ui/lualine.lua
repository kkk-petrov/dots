local colors = require("ui.assets").colors
local separators = require("ui.assets").separators
local utils = require("utils")

local bg = CONFIG.transparency and "NONE" or colors.bg

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

-- Components
local mode = {
	"mode",
	padding = { left = 2, right = 2 },
	separator = { right = separators.rounded.right },
	icon = "",
	color = { bg = colors.violet, fg = colors.bg, gui = "italic" },
}

local lsp = {
	utils.get_lsp,
	icon = "",
	padding = { left = 1, right = 1 },
	cond = conditions.lsp_not_empty,
}

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic", "nvim_lsp" },
	symbols = { error = " ", warn = " ", hint = " ", info = " " },
	sections = { "error", "warn", "info", "hint" },
	padding = { left = 2, right = 1 },
	separator = { right = "", left = "" },
	diagnostics_color = {
		error = "DiagnosticError", -- Changes diagnostics' error color.
		warn = "DiagnosticWarn", -- Changes diagnostics' warn color.
		info = "DiagnosticInfo", -- Changes diagnostics' info color.
		hint = "DiagnosticHint", -- Changes diagnostics' hint color.
	},
	colored = true, -- Displays diagnostics status in color if set to true.
	update_in_insert = true, -- Update diagnostics in insert mode.
	always_visible = false, -- Show diagnostics even if there are none.
}

local filename = {
	"filename",
	cond = conditions.buffer_not_empty,
	icon = utils.get_file_icon(vim.fn.expand("%:t")),
	separator = { left = separators.rounded.left },
	padding = { left = 1, right = 1 },
}

local cwd = {
	utils.get_cwd,
	icon = "󰉖",
	separator = { left = separators.rounded.left },
	padding = { left = 1, right = 1 },
	color = { bg = colors.red, fg = colors.bg, gui = "italic" },
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
}

local config = {
	options = {
		globalstatus = CONFIG.global_statusline,
		component_separators = "",
		section_separators = { left = separators.rounded.left, right = separators.rounded.right },
		theme = {
			normal = {
				a = { fg = colors.bg, bg = colors.violet },
				y = { fg = colors.bg, bg = colors.yellow },
			},
			insert = {
				a = { fg = colors.bg, bg = colors.red },
				y = { fg = colors.bg, bg = colors.yellow },
			},
			visual = {
				a = { fg = colors.bg, bg = colors.blue },
				y = { fg = colors.bg, bg = colors.yellow },
			},
			replace = {
				a = { fg = colors.bg, bg = colors.red },
				y = { fg = colors.bg, bg = colors.yellow },
			},
			command = {
				a = { fg = colors.bg, bg = colors.yellow },
				y = { fg = colors.bg, bg = colors.yellow },
			},
		},
		disabled_filetypes = {
			"Lazy",
			"Mason",
			"neo-tree",
			"NvimTree",
			"aerial",
			"help",
			"man",
			"dap-repl",
			"dapui_scopes",
			"dapui_breakpoints",
			"dapui_stacks",
			"dapui_watches",
			"dapui_console",
		},
		ignore_focus = {
			"Lazy",
			"Mason",
			"neo-tree",
			"NvimTree",
			"aerial",
			"help",
			"man",
			"dap-repl",
			"dapui_scopes",
			"dapui_breakpoints",
			"dapui_stacks",
			"dapui_watches",
			"dapui_console",
		},
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
			lsp,
			branch,
			diff,
		},
		lualine_y = {
			filename,
		},
		lualine_z = {
			cwd,
		},
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
