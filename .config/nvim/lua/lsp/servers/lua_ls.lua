local M = {}

M.settings = {
	Lua = {
		completion = {
			callSnippet = "Replace",
		},
		diagnostics = {
			globals = { "vim" },
		},
		workspace = {
			library = {
				[vim.fn.expand("$VIMRUNTIME/lua")] = true,
				[vim.fn.stdpath("config") .. "/lua"] = true,
			},
		},
	},
}

return M
