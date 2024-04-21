return {
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			"folke/neodev.nvim",
			"folke/neoconf.nvim",
		},
		config = function(_, opts)
			local lspconfig = require("lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local border = require("ui.assets").border

			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
			vim.lsp.handlers["textDocument/signatureHelp"] =
				vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })

			local capabilities = cmp_nvim_lsp.default_capabilities()
			local disabled = { "tsserver", "lua_ls" }

			for _, server in ipairs(lspconfig.util.available_servers()) do
				if not vim.tbl_contains(disabled, server) then
					lspconfig[server].setup({
						capabilities = capabilities,
						on_attach = function(client, bufnr)
							if client.server_capabilities.inlayHintProvider then
								vim.lsp.buf.inlay_hint(bufnr, true)
							end
						end,
					})
				end
			end

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
		end,
		opts = {
			inlay_hints = {
				enable = true,
			},
			setup = {
				clangd = function(_, opts)
					opts.capabilities.offsetEncoding = { "utf-16" }
				end,
			},
		},
	},
}
