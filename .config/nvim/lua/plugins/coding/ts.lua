local baseDefinitionHandler = vim.lsp.handlers["textDocument/definition"]

local filter = require("utils.lsp").filter
local filterReactDTS = require("utils.lsp").filterReactDTS

local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		silent = true,
		border = require("ui.assets").border or "rounded",
	}),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = require("ui.assets").border or "rounded" }),
	["textDocument/publishDiagnostics"] = vim.lsp.with(
		vim.lsp.diagnostic.on_publish_diagnostics,
		{ virtual_text = CONFIG.virtual_text }
	),
	["textDocument/definition"] = function(err, result, method, ...)
		P(result)
		if vim.tbl_islist(result) and #result > 1 then
			local filtered_result = filter(result, filterReactDTS)
			return baseDefinitionHandler(err, filtered_result, method, ...)
		end

		baseDefinitionHandler(err, result, method, ...)
	end,
}

return {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	opts = {},
	config = function()
		require("typescript-tools").setup({
			on_attach = function(client, bufnr)
				if vim.fn.has("nvim-0.10") then
					vim.lsp.inlay_hint.enable(bufnr, true)
				end
			end,
			handlers = handlers,
			settings = {
				separate_diagnostic_server = true,
				code_lens = "off",
				tsserver_file_preferences = {
					includeInlayParameterNameHints = "all",
					includeCompletionsForModuleExports = true,
					quotePreference = "auto",
				},
			},
		})
	end,
}
