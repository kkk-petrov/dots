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
			winbar = false, -- toggle to show selector on winbar
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
			separator = { left = "▏", right = "▕" }, -- string | { left: string, right: string, override: string | nil }
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
		},
		enable_git_status = true,
		default_component_configs = {
			git_status = {
				symbols = {
					-- Change type
					added = "✚",
					deleted = "✖",
					modified = "",
					renamed = "󰁕",
					-- Status type
					untracked = "",
					ignored = "",
					unstaged = "",
					staged = "",
					conflict = "",
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
		vim.fn.sign_define("DiagnosticSignError", { text = "󰨐", texthl = "DiagnosticSignError" })
		vim.fn.sign_define("DiagnosticSignWarn", { text = "󰨐", texthl = "DiagnosticSignWarn" })
		vim.fn.sign_define("DiagnosticSignInfo", { text = "󰨐", texthl = "DiagnosticSignInfo" })
		vim.fn.sign_define("DiagnosticSignHint", { text = "󰨐", texthl = "DiagnosticSignHint" })

		vim.cmd([[
      hi FileExplorer gui=bold,italic guibg=#151523
      hi NeoTreeNormal guibg=#151523
      hi NeoTreeNormalNC guibg=#151523
      hi NeoTreeWinSeparator guibg=#151523 guifg=#151523
      hi NeoTreeVertSplit guibg=#151523 guifg=#151523
      hi NeoTreeStatusLine guibg=#151523 guifg=#151523
      hi NeoTreeEndOfBuffer guibg=#151523 guifg=#151523
      hi NeoTreeEndOfBuffer guibg=#151523 guifg=#151523
    ]])

		require("neo-tree").setup(opts)
	end,
}
