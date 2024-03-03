return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"jay-babu/mason-null-ls.nvim",
	},
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to enable uncomment this
	config = function()
		local mason_null_ls = require("mason-null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		local null_ls = require("null-ls")

		mason_null_ls.setup({
			ensure_installed = {
				"biome",
				"prettier", -- prettier formatter
				"eslint_d", -- js linter
				"stylua", -- lua formatter
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
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.biome,
				-- null_ls.builtins.formatting.clang_format,
				-- null_ls.builtins.diagnostics.eslint_d.with({ -- js/ts linter
				-- 	condition = function(utils)
				-- 		return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs" }) -- only enable if root has .eslintrc.js or .eslintrc.cjs
				-- 	end,
				-- }),
			},
		})
	end,
}
