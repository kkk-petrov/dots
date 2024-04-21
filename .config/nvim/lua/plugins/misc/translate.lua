return {
	"uga-rosa/translate.nvim",
	opts = {
		default = {
			command = "translate_shell",
		},
		silent = true,
		preset = {
			output = {
				split = {
					append = true,
				},
				floating = {
					style = "minimal",
					focusable = true,
					border = require("ui.assets").border or "rounded",
					zindex = 51,
				},
			},
		},
	},
}
