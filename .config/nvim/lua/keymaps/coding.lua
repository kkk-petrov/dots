local map = require("utils").map
local dap = require("dap")
local dapui = require("dapui")
local trouble = require("trouble")

-- LSP
map("n", "gR", "<cmd>Telescope lsp_references<CR>", "References")
map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", "Definitions")
map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", "Implementations")
map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", "Type definitions")
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Actions")
map("n", "[d", vim.diagnostic.goto_prev, "Go to previous diagnostic")
map("n", "]d", vim.diagnostic.goto_next, "Go to next diagnostic")
map("n", "K", vim.lsp.buf.hover, "Show docs")
map("n", "<leader>cD", vim.lsp.buf.declaration, "Go to declaration")
map("n", "<leader>cr", "<cmd>Telescope lsp_references<CR>", "References")
map("n", "<leader>cR", "<cmd>TSToolsFileReferences<CR>", "File references")
map("n", "<leader>ci", "<cmd>Telescope lsp_implementations<CR>", "Implementations")
map("n", "<leader>cd", "<cmd>Telescope lsp_definitions<CR>", "Definitions")
map("n", "<leader>ct", "<cmd>Telescope lsp_type_definitions<CR>", "Type definitions")
map("n", "<leader>cx", "<cmd>Telescope diagnostics bufnr=0<CR>", "Buffer diagnostics")
map("n", "<leader>cX", vim.diagnostic.open_float, "Line diagnostics")
map("n", "<leader>cn", vim.lsp.buf.rename, "Smart rename")
map("n", "<leader>cq", ":LspRestart<CR>", "Restart LSP")
map("n", "<leader>co", "<cmd>TSToolsOrganizeImports<CR>", "Organize imports")
map("n", "<leader>cu", "<cmd>TSToolsRemoveUnusedImports<CR>", "Remove unused imports")
map("n", "<leader>ct", "<cmd>TSToolsAddMissingImports<CR>", "Add missing imports")

-- Debug
map("n", "<leader>dc", dap.continue, "Continue")
map("n", "<pageup>", dap.continue, "Continue")

map("n", "<leader>dt", dap.toggle_breakpoint, "Toggle breakpoint")
map("n", "tt", dap.toggle_breakpoint, "Toggle breakpoint")
map("n", "<leader>du", dapui.toggle, "Toggle UI")
map("n", "<leader>da", function()
	if vim.fn.filereadable(".vscode/launch.json") then
		local dap_vscode = require("dap.ext.vscode")
		dap_vscode.load_launchjs(nil, {
			["pwa-node"] = require("plugins.dap.config.js").langs,
			["chrome"] = require("plugins.dap.config.js").langs,
			["pwa-chrome"] = require("plugins.dap.config.js").langs,
		})
	end
	require("dap").continue()
end, "Run")

-- Diagnostics
map("n", "<leader>xx", function()
	trouble.toggle()
end, "File diagnostics")

map("n", "<leader>xw", function()
	trouble.toggle("workspace_diagnostics")
end, "Workspace diagnostics")

map("n", "<leader>xd", function()
	trouble.toggle("document_diagnostics")
end, "Document diagnostics")

map("n", "<leader>xd", function()
	trouble.toggle("quickfix")
end, "Quick fix")

map("n", "<leader>xd", function()
	trouble.toggle("loclist")
end, "Location list")

-- Todo
map("n", "<leader>cT", "<cmd>TodoTelescope<cr>", "Todo telescope")
map("n", "<leader>xt", "<cmd>TodoTrouble<cr>", "Todo trouble")
