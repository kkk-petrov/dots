local opts = { noremap = true, silent = true }
local builtin = require("telescope.builtin")
local map = vim.keymap.set

-- Tmux Navigate

-- Navigate vim panes better
-- map("n", "<c-k>", ":wincmd k<CR>")
-- map("n", "<c-j>", ":wincmd j<CR>")
-- map("n", "<c-h>", ":wincmd h<CR>")
-- map("n", "<c-l>", ":wincmd l<CR>")

-- Better motions
map({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
map({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
map({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "spider-b" })

-- Dashboard
map("n", "<leader>D", "<cmd>Dashboard<CR>", { noremap = true, silent = true, desc = "Dashboard" })

-- Lazy
map("n", "<leader>l", "<cmd>Lazy<CR>", { unpack(opts), desc = "Lazy" })

-- Lazy
map("n", "<leader>m", "<cmd>Mason<CR>", { unpack(opts), desc = "Mason" })

-- File explorer
map("n", "<leader>e", "<cmd>Neotree reveal_force_cwd filesystem left toggle<CR>", { desc = "Explore" })

-- Telescope
map("n", "<leader><Space>", ":Telescope file_browser path=%:p:h=%:p:h<cr>", { unpack(opts), desc = "Browse Files" })
map("n", "<leader>f", " ", { desc = "Find" })
-- map("n", "<leader>/", builtin.find_files, { desc = "Find files" })
map("n", "<leader>/", builtin.live_grep, { desc = "Live grep" })

-- Save on CTRL + S
map({ "n", "i", "v" }, "<C-s>", "<Esc><cmd>w<CR>")
map({ "n", "i", "v" }, "<C-S>", "<Esc><cmd>wa<CR>")
-- Resize window using <ctrl> arrow keys map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Diagnostics
map("n", "<leader>x", " ", { desc = "Diagnostics" })
map("n", "<leader>xx", function()
	require("trouble").toggle()
end, { desc = "File Diagnostics" })
map("n", "<leader>xw", function()
	require("trouble").toggle("workspace_diagnostics")
end, { desc = "Workspace Diagnostics" })
map("n", "<leader>xd", function()
	require("trouble").toggle("document_diagnostics")
end, { desc = "Document Diagnostics" })
map("n", "<leader>xq", function()
	require("trouble").toggle("quickfix")
end, { desc = "Quick Fix" })
map("n", "<leader>xl", function()
	require("trouble").toggle("loclist")
end, { desc = "Location list" })
map("n", "gr", function()
	require("trouble").toggle("lsp_references")
end, { desc = "LSP References" })

-- Buffers
map("n", "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", { unpack(opts), desc = "Move to previous buffer" })
map("n", "<S-l>", "<Cmd>BufferLineCycleNext<CR>", { unpack(opts), desc = "Move to next buffer" })
map("n", "<leader>b", " ", { unpack(opts), desc = "Buffers" })
map("n", "<leader>bd", "<Cmd>BufferClose<CR>", { unpack(opts), desc = "Close current buffer" })
map("n", "<leader>bb", "<Cmd>BufferLineCyclePrev<CR>", { unpack(opts), desc = "Move to previous buffer" })
map("n", "<leader>bn", "<Cmd>BufferLineCycleNext<CR>", { unpack(opts), desc = "Move to next buffer" })
map("n", "<A-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", opts)
map("n", "<A-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", opts)
map("n", "<A-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", opts)
map("n", "<A-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", opts)
map("n", "<A-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", opts)
map("n", "<A-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", opts)
map("n", "<A-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", opts)
map("n", "<A-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", opts)
map("n", "<A-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", opts)
map("n", "<C-p>", "<Cmd>BufferLinePick<CR>", opts)
map("n", "<leader>bc", "<Cmd>BufferLinePickClose<CR>", { unpack(opts), desc = "Pick buffer to close" })
map("n", "<leader>bd", "<Cmd>bd<CR>", { unpack(opts), desc = "Close current buffer" })

-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- New File
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- Quit
map("n", "<leader>Q", "<cmd>qa<cr>", { desc = "Quit all" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- LSP
map("n", "K", vim.lsp.buf.hover, { desc = "Info" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to defenition" })
map("n", "<leader>c", vim.lsp.buf.definition, { desc = "LSP" })
map("n", "<leader>cd", vim.lsp.buf.definition, { desc = "Go to defenition" })
map("n", "<leader>cr", vim.lsp.buf.references, { desc = "LSP references" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })

-- Move visual
map("v", "<A-j>", "<Plug>GoVSMDown", { desc = "Move visual down" })
map("v", "<A-k>", "<Plug>GoVSMUp", { desc = "Move visual up" })
map("v", "<A-h>", "<Plug>GoVSMLeft", { desc = "Move visual left" })
map("v", "<A-l>", "<Plug>GoVSMRight", { desc = "Move visual right" })
