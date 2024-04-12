return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"jay-babu/mason-null-ls.nvim",
	},
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function(_, opts)
		local mason_null_ls = require("mason-null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting

		mason_null_ls.setup({
			ensure_installed = {
				"biome",
				"stylua",
				"prettier",
			},
		})

		null_ls.setup({
			on_attach = function(current_client, bufnr)
				if current_client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								async = false,
							})
						end,
					})
				end
			end,
			sources = {
				formatting.prettier,
				formatting.stylua,
			},
		})
	end,
}
