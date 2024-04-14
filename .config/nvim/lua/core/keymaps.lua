local map = vim.keymap.set
local opts = { noremap = true, silent = true }

local telescope = require("telescope.builtin")
local ls = require("luasnip")
local splits = require("smart-splits")
local dap = require("dap")
local dapui = require("dapui")

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
--  SOME KEYMAPS ARE DEFINED IN plugins/whichkey.lua  --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Navigation in insert mode
opts.desc = "Up"
map("i", "<A-k>", "<Up>", opts)

opts.desc = "Down"
map("i", "<A-j>", "<Down>", opts)

opts.desc = "Right"
map("i", "<A-l>", "<Right>", opts)

opts.desc = "Left"
map("i", "<A-h>", "<Left>", opts)

-- Better motions
opts.desc = "Spider-w"
map({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", opts)

opts.desc = "Spider-e"
map({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", opts)

opts.desc = "Spider-b"
map({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", opts)

-- Lazy
opts.desc = "Lazy"
map("n", "<leader>l", "<cmd>Lazy<CR>", opts)

-- Mason
opts.desc = "Mason"
map("n", "<leader>m", "<cmd>Mason<CR>", opts)

-- File explorer
opts.desc = "Explorer"
map("n", "<leader>e", "<cmd>Neotree reveal_force_cwd filesystem toggle<CR>", opts)

-- Telescope
opts.desc = "Browse files"
map("n", "<leader>/", "<cmd>Telescope file_browser path=%:p:h=%:p:h<cr>", opts)

_G.picker_open = false
local function search()
	if _G.picker_open then
		telescope.resume()
	else
		telescope.live_grep()
		_G.picker_open = true
	end
end

opts.desc = "Search"
map("n", "<leader><Space>", search, opts)

opts.desc = "Live grep"
map("n", "<leader>F", telescope.live_grep, opts)

-- Save on CTRL + S
opts.desc = "Save"
map({ "n", "i", "v" }, "<C-s>", "<Esc><cmd>w<CR>", opts)

-- Resize window using <ctrl + arrow> keys
opts.desc = "Increase window height"
map("n", "<C-Up>", "<cmd>SmartResizeUp<cr>", opts)
map("n", "<A-k>", "<cmd>SmartResizeUp<cr>", opts)

opts.desc = "Decrease window height"
map("n", "<C-Down>", "<cmd>SmartResizeDown<cr>", opts)
map("n", "<A-j>", "<cmd>SmartResizeDown<cr>", opts)

opts.desc = "Increase window width"
map("n", "<C-Right>", "<cmd>SmartResizeRight<cr>", opts)
map("n", "<A-l>", "<cmd>SmartResizeRight<cr>", opts)

opts.desc = "Decrease window width"
map("n", "<C-Left>", "<cmd>SmartResizeLeft<cr>", opts)
map("n", "<A-h>", "<cmd>SmartResizeLeft<cr>", opts)

-- Buffers
opts.desc = "Move to previous buffer"
map("n", "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", opts)

opts.desc = "Move to next buffer"
map("n", "<S-l>", "<Cmd>BufferLineCycleNext<CR>", opts)

opts.desc = "Pick buffer"
map("n", "<C-p>", "<Cmd>BufferLinePick<CR>", opts)

-- Swap buffers
opts.desc = "Swap left"
map("n", "<leader>bh", splits.swap_buf_left, opts)
opts.desc = "Swap down"
map("n", "<leader>bj", splits.swap_buf_down, opts)
opts.desc = "Swap up"
map("n", "<leader>bk", splits.swap_buf_up, opts)
opts.desc = "Swap right"
map("n", "<leader>bl", splits.swap_buf_right, opts)

-- Better indenting
opts.desc = "Indent right"
map("v", "<", "<gv", opts)

opts.desc = "Indent left"
map("v", ">", ">gv", opts)

-- Clear search with <esc>
opts.desc = "Escape and clear hlsearch"
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", opts)

-- Move visual
opts.desc = "Move visual down"
map("v", "<A-j>", "<Plug>GoVSMDown", opts)

opts.desc = "Move visual up"
map("v", "<A-k>", "<Plug>GoVSMUp", opts)

opts.desc = "Move visual left"
map("v", "<A-h>", "<Plug>GoVSMLeft", opts)

opts.desc = "Move visual right"
map("v", "<A-l>", "<Plug>GoVSMRight", opts)

-- Luasnip
opts.desc = "Jumping forward/expanding a snippet"
map({ "i" }, "<C-l>", function()
	ls.expand_or_jump()
end, opts)

opts.desc = "Jump backward"
map({ "i", "s" }, "<C-h>", function()
	ls.jump(-1)
end, opts)

opts.desc = "Change active choise"
map({ "i", "s" }, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, opts)

-- Wezterm navigation
opts.desc = "Switch active wezterm pane"
map({ "n", "t" }, "<C-h>", "<CMD>NavigatorLeft<CR>")
map({ "n", "t" }, "<C-l>", "<CMD>NavigatorRight<CR>")
map({ "n", "t" }, "<C-k>", "<CMD>NavigatorUp<CR>")
map({ "n", "t" }, "<C-j>", "<CMD>NavigatorDown<CR>")

-- Todo
opts.desc = "Todo telescope"
map("n", "<leader>cT", "<cmd>TodoTelescope<cr>", opts)

opts.desc = "Todo trouble"
map("n", "<leader>xt", "<cmd>TodoTrouble<cr>", opts)

-- UFO
opts.desc = "Open all folds"
map("n", "zR", require("ufo").openAllFolds)
opts.desc = "Close all folds"
map("n", "zM", require("ufo").closeAllFolds)

-- Translate
opts.desc = "Translate to russian"
map("x", "<leader>tr", "<CMD>Translate ru<CR>")

opts.desc = "Translate to english"
map("x", "<leader>te", "<CMD>Translate en<CR>")

-- LSP
opts.desc = "Show LSP references"
map("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

opts.desc = "Go to declaration"
map("n", "gD", vim.lsp.buf.declaration, opts)

opts.desc = "Show LSP definitions"
map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

opts.desc = "Show LSP implementations"
map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

opts.desc = "Show LSP type definitions"
map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

opts.desc = "See available code actions"
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

opts.desc = "Smart rename"
map("n", "<leader>cn", vim.lsp.buf.rename, opts)

opts.desc = "Show buffer diagnostics"
map("n", "<leader>cD", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

opts.desc = "Show line diagnostics"
map("n", "<leader>cd", vim.diagnostic.open_float, opts)

opts.desc = "Go to previous diagnostic"
map("n", "[d", vim.diagnostic.goto_prev, opts)

opts.desc = "Go to next diagnostic"
map("n", "]d", vim.diagnostic.goto_next, opts)

opts.desc = "Show documentation"
map("n", "K", vim.lsp.buf.hover, opts)

opts.desc = "Restart LSP"
map("n", "<leader>cr", ":LspRestart<CR>", opts)

opts.desc = "Show LSP references"
map("n", "<leader>cr", "<cmd>Telescope lsp_references<CR>", opts)

opts.desc = "Go to declaration"
map("n", "<leader>cD", vim.lsp.buf.declaration, opts)

opts.desc = "Show LSP definitions"
map("n", "<leader>cd", "<cmd>Telescope lsp_definitions<CR>", opts)

opts.desc = "Show LSP implementations"
map("n", "<leader>ci", "<cmd>Telescope lsp_implementations<CR>", opts)

opts.desc = "Show LSP type definitions"
map("n", "<leader>ct", "<cmd>Telescope lsp_type_definitions<CR>", opts)

-- TSTools
opts.desc = "Organize imports"
map("n", "<leader>co", "<cmd>TSToolsOrganizeImports<CR>", opts)

opts.desc = "Remove unused imports"
map("n", "<leader>cu", "<cmd>TSToolsRemoveUnusedImports<CR>", opts)

opts.desc = "Add missing imports"
map("n", "<leader>ct", "<cmd>TSToolsAddMissingImports<CR>", opts)

opts.desc = "File references"
map("n", "<leader>cR", "<cmd>TSToolsFileReferences<CR>", opts)

-- CodeSnap
opts.desc = "CodeSnap"
map("x", "<leader>cs", ":CodeSnap<CR>", opts)

-- Aerial
opts.desc = "Aerial previous"
map("n", "{", "<cmd>AerialPrev<CR>", opts)
opts.desc = "Aerial next"
map("n", "}", "<cmd>AerialNext<CR>", opts)
opts.desc = "Aerial"
map("n", "<leader>a", "<cmd>AerialToggle! right<CR>", opts)

-- Zen mode
opts.desc = "Zen mode"
map("n", "<leader>z", "<cmd>ZenMode<CR>", opts)

-- Debug
opts.desc = "Run"
map("n", "<leader>dr", dap.run, opts)

opts.desc = "Continue"
map("n", "<leader>dc", dap.continue, opts)

opts.desc = "Toggle breakpoint"
map("n", "<leader>dt", dap.toggle_breakpoint, opts)

opts.desc = "Toggle UI"
map("n", "<leader>du", dapui.toggle, opts)

opts.desc = "Open float window"
map("n", "<leader>df", function()
	vim.print(dapui.elements)
	dapui.float_element(nil, { width = nil, height = nil, enter = true })
end, opts)
