local mason_ok, mason = pcall(require, "mason")
local mason_lsp_ok, mason_lsp = pcall(require, "mason-lspconfig")
local lspui_ok, lspui = pcall(require, "lspconfig.ui.windows")
local border = require("ui.assets").border or "rounded"

if not lspui_ok or not mason_lsp_ok or not mason_ok then
	return
end

lspui.default_options.border = border
vim.diagnostic.config({
	float = { border = border },
})

mason.setup({
	ui = {
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
		border = require("ui.assets").border or "rounded",
	},
})

mason_lsp.setup({
	ensure_installed = {
		"bashls",
		"cssls",
		"eslint",
		"graphql",
		"html",
		"jsonls",
		"lua_ls",
		"prismals",
		"tailwindcss",
		"tsserver",
		"emmet_ls",
		"biome",
		"clangd",
		"gopls",
		"rust_analyzer",
		"pyright",
	},
	automatic_installation = true,
})

local lspconfig = require("lspconfig")

local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		silent = true,
		border = require("ui.assets").border or "rounded",
	}),
	["textDocument/signatureHelp"] = vim.lsp.with(
		vim.lsp.handlers.signature_help,
		{ border = require("ui.assets").border or "rounded" }
	),
	["textDocument/publishDiagnostics"] = vim.lsp.with(
		vim.lsp.diagnostic.on_publish_diagnostics,
		{ virtual_text = CONFIG.virtual_text }
	),
}

local function on_attach(client, bufnr)
	-- set up buffer keymaps, etc.
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

require("mason-lspconfig").setup_handlers({
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function(server_name)
		require("lspconfig")[server_name].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			handlers = handlers,
		})
	end,

	["tsserver"] = function()
		-- Skip since we use typescript-tools.nvim
	end,

	["tailwindcss"] = function()
		lspconfig.tailwindcss.setup({
			capabilities = require("lsp.servers.tailwindcss").capabilities,
			filetypes = require("lsp.servers.tailwindcss").filetypes,
			handlers = handlers,
			init_options = require("lsp.servers.tailwindcss").init_options,
			on_attach = require("lsp.servers.tailwindcss").on_attach,
			settings = require("lsp.servers.tailwindcss").settings,
		})
	end,

	["cssls"] = function()
		lspconfig.cssls.setup({
			capabilities = capabilities,
			handlers = handlers,
			on_attach = require("lsp.servers.cssls").on_attach,
			settings = require("lsp.servers.cssls").settings,
		})
	end,

	["eslint"] = function()
		lspconfig.eslint.setup({
			capabilities = capabilities,
			handlers = handlers,
			on_attach = require("lsp.servers.eslint").on_attach,
			settings = require("lsp.servers.eslint").settings,
		})
	end,

	["jsonls"] = function()
		lspconfig.jsonls.setup({
			capabilities = capabilities,
			handlers = handlers,
			on_attach = on_attach,
			settings = require("lsp.servers.jsonls").settings,
		})
	end,

	["lua_ls"] = function()
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			handlers = handlers,
			on_attach = on_attach,
			settings = require("lsp.servers.lua_ls").settings,
		})
	end,
})
