return {
	{
		"folke/neoconf.nvim",
		cmd = "Neoconf",
	},
	{
		"wakatime/vim-wakatime",
	},
	{
		"MunifTanjim/nui.nvim",
	},
	{
		"fatih/vim-go",
	},
	{
		"gbprod/yanky.nvim",
		opts = {},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"chrisgrieser/nvim-spider",
		lazy = true,
	},
	{
		"booperlv/nvim-gomove",
	},
	{
		"numToStr/Comment.nvim",
		lazy = false,
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},
	{
		"onsails/lspkind.nvim",
	},
	{
		"echasnovski/mini.bufremove",
		version = false,
		opts = {},
	},
	{
		"willothy/wezterm.nvim",
		config = true,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			signs = false,
		},
	},
	{
		"numToStr/Navigator.nvim",
		config = function()
			require("Navigator").setup()
		end,
	},
	{
		"Exafunction/codeium.vim",
	},
	{
		"fei6409/log-highlight.nvim",
		opts = {},
	},
	{
		"folke/neodev.nvim",
		opts = {},
	},
	{
		"mistricky/codesnap.nvim",
		build = "make",
		opts = {
			has_breadcrumbs = true,
			bg_theme = "default",
			watermark = "",
			mac_window_bar = true,
			title = "",
			code_font_family = "JetBrainsMono Nerd Font",
		},
	},
}
