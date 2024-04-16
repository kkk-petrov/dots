local colors = require("utils.ui").colors
return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		source_selector = {
			winbar = true, -- toggle to show selector on winbar
			statusline = false, -- toggle to show selector on statusline
			show_scrolled_off_parent_node = false, -- boolean
			sources = { -- table
				{
					source = "filesystem", -- string
					display_name = " 󰉓 Files ", -- string | nil
				},
				{
					source = "buffers", -- string
					display_name = " 󰈚 Buffers ", -- string | nil
				},
				{
					source = "git_status", -- string
					display_name = " 󰊢 Git ", -- string | nil
				},
			},
			content_layout = "start", -- string
			tabs_layout = "equal", -- string
			truncation_character = "…", -- string
			tabs_min_width = nil, -- int | nil
			tabs_max_width = nil, -- int | nil
			padding = 0, -- int | { left: int, right: int }
			separator = {
				left = "",
				right = "",
			}, -- string | { left: string, right: string, override: string | nil }
			separator_active = nil, -- string | { left: string, right: string, override: string | nil } | nil
			show_separator_on_edge = false, -- boolean
			highlight_tab = "NeoTreeTabInactive", -- string
			highlight_tab_active = "NeoTreeTabActive", -- string
			highlight_background = "NeoTreeTabInactive", -- string
			highlight_separator = "NeoTreeTabSeparatorInactive", -- string
			highlight_separator_active = "NeoTreeTabSeparatorActive", -- string
		},
		filesystem = {
			bind_to_cwd = false,
			follow_current_file = { enabled = true },
			use_libuv_file_watcher = true,
			hijack_netrw_behavior = "open_current",
		},
		enable_git_status = true,
		default_component_configs = {
			git_status = {
				symbols = {
					added = "✚",
					deleted = "✖",
					modified = "",
					renamed = "󰁕",
				},
			},
			modified = {
				symbol = "+",
				highlight = "NeoTreeAdded",
			},
		},
		window = {
			position = "left",
			width = 30,
			mappings = {
				["<tab>"] = { "toggle_preview", config = { use_float = true, use_image_nvim = false } },
			},
		},
	},
	config = function(_, opts)
		local define_highlight = require("utils").define_highlights
		local define_signs = require("utils").define_signs

		local highlights = {
			FileExplorer = { bold = false, italic = true, bg = colors.bg_dark, fg = colors.pink },
			NeoTreeNormal = { bg = colors.bg_dark },
			NeoTreeNormalNC = { bg = colors.bg_dark },
			NeoTreeWinSeparator = { bg = colors.bg, fg = colors.bg },
			NeoTreeStatusLine = { bg = colors.bg, fg = colors.bg },
			NeoTreeTabInactive = { bg = colors.bg_dark, fg = colors.gray },
			NeoTreeTabActive = { bold = true, italic = true, bg = colors.bg_dark, fg = colors.pink },
			NeoTreeTabInactiveSeparator = { bg = colors.bg_dark, fg = colors.bg_dark },
			NeoTreeTabSeparatorInactive = { bg = colors.bg_dark, fg = colors.bg_dark },
			NeoTreeTabSeparatorActive = { bg = colors.bg_dark, fg = colors.bg_dark },
			NeoTreeEndOfBuffer = { bg = colors.bg_dark, fg = colors.bg_dark },
		}

		local signs = {
			DiagnosticSignError = { text = "󰨐", texthl = "DiagnosticSignError" },
			DiagnosticSignWarn = { text = "󰨐", texthl = "DiagnosticSignWarn" },
			DiagnosticSignInfo = { text = "󰨐", texthl = "DiagnosticSignInfo" },
			DiagnosticSignHint = { text = "󰨐", texthl = "DiagnosticSignHint" },
		}

		define_highlight(highlights)
		define_signs(signs)

		require("neo-tree").setup(opts)
	end,
}
