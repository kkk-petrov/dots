local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local builtin = require("telescope.builtin")
local ls = require("luasnip")
local wezterm = require("wezterm")

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- SOME KEYMAPS ARE DEFINED IN plugins/ui/whichkey.lua --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

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

opts.desc = "Live grep"
map("n", "<leader><Space>", builtin.live_grep, opts)

-- Save on CTRL + S
opts.desc = "Save"
map({ "n", "i", "v" }, "<C-s>", "<Esc><cmd>w<CR>", opts)

-- Resize window using <ctrl> arrow keys
opts.desc = "Increase window height"
map("n", "<C-Up>", "<cmd>resize +2<cr>", opts)

opts.desc = "Decrease window height"
map("n", "<C-Down>", "<cmd>resize -2<cr>", opts)

opts.desc = "Increase window width"
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", opts)

opts.desc = "Decrease window width"
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", opts)

-- Buffers
opts.desc = "Move to previous buffer"
map("n", "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", opts)

opts.desc = "Move to next buffer"
map("n", "<S-l>", "<Cmd>BufferLineCycleNext<CR>", opts)

opts.desc = "Pick buffer"
map("n", "<C-p>", "<Cmd>BufferLinePick<CR>", opts)

opts.desc = "Go to N buffer"
map("n", "<A-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", opts)
map("n", "<A-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", opts)
map("n", "<A-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", opts)
map("n", "<A-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", opts)
map("n", "<A-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", opts)
map("n", "<A-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", opts)
map("n", "<A-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", opts)
map("n", "<A-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", opts)
map("n", "<A-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", opts)

-- Better indenting
opts.desc = "Indent right"
map("v", "<", "<gv", opts)

opts.desc = "Indent left"
map("v", ">", ">gv", opts)

-- Quit
opts.desc = "Quit all"
map("n", "<leader>Q", "<cmd>qa<cr>", opts)

-- Clear search with <esc>
opts.desc = "Escape and clear hlsearch"
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", opts)

-- LSP
opts.desc = "Info"
map("n", "K", vim.lsp.buf.hover, opts)

opts.desc = "Go to definition"
map("n", "gd", vim.lsp.buf.definition, opts)

opts.desc = "LSP"
map("n", "<leader>c", vim.lsp.buf.definition, opts)

opts.desc = "Go to definition"
map("n", "<leader>cd", vim.lsp.buf.definition, opts)

opts.desc = "LSP references"
map("n", "<leader>cr", vim.lsp.buf.references, opts)

opts.desc = "Code actions"
map("n", "<leader>ca", vim.lsp.buf.code_action, opts)

-- Move visual
opts.desc = "Move visual down"
map("v", "<A-j>", "<Plug>GoVSMDown", opts)

opts.desc = "Move visual up"
map("v", "<A-k>", "<Plug>GoVSMUp", opts)

opts.desc = "Move visual left"
map("v", "<A-h>", "<Plug>GoVSMLeft", opts)

opts.desc = "Move visual right"
map("v", "<A-l>", "<Plug>GoVSMRight", opts)

-- Toggle colorizer
opts.desc = "Toggle colorizer"
map("n", "<leader>h", "<cmd>ColorizerToggle<CR>", opts)

-- Projects
opts.desc = "Projects"
map("n", "<leader>p", function()
	require("telescope").extensions.projects.projects({})
end, opts)

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

-- Better navigation
opts.desc = "Switch active wezterm pane"
map({ "n", "t" }, "<C-h>", "<CMD>NavigatorLeft<CR>")
map({ "n", "t" }, "<C-l>", "<CMD>NavigatorRight<CR>")
map({ "n", "t" }, "<C-k>", "<CMD>NavigatorUp<CR>")
map({ "n", "t" }, "<C-j>", "<CMD>NavigatorDown<CR>")
-- map({'n', 't'}, '<C-p>', '<CMD>NavigatorPrevious<CR>')

local function hurl()
	local cmd = "hurl -v " .. vim.fn.expand("%") .. " | jq"

	local handle = io.popen(cmd, "r")
	local output = handle:read("*all")
	handle:close()

	vim.api.nvim_command("new")

	local bufnr = vim.api.nvim_get_current_buf()
	vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, vim.split(output, "\n"))
end

opts.desc = "Run hurl"
map("n", "<leader>r", hurl, opts)
