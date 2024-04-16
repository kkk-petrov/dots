local map = require("utils").map
local splits = require("smart-splits")

-- Navigation in insert mode
map("i", "<A-k>", "<Up>", "Up")
map("i", "<A-j>", "<Down>", "Down")
map("i", "<A-l>", "<Right>", "Right")
map("i", "<A-h>", "<Left>", "Left")

-- Better motions
map({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", "Spider-w")
map({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", "Spider-e")
map({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", "Spider-b")

-- Resize
map("n", "<C-Up>", "<cmd>SmartResizeUp<cr>", "Increase window height")
map("n", "<A-k>", "<cmd>SmartResizeUp<cr>", "Increase window height")
map("n", "<C-Down>", "<cmd>SmartResizeDown<cr>", "Decrease window height")
map("n", "<A-j>", "<cmd>SmartResizeDown<cr>", "Decrease window height")
map("n", "<C-Right>", "<cmd>SmartResizeRight<cr>", "Increase window width")
map("n", "<A-l>", "<cmd>SmartResizeRight<cr>", "Increase window width")
map("n", "<C-Left>", "<cmd>SmartResizeLeft<cr>", "Decrease window width")
map("n", "<A-h>", "<cmd>SmartResizeLeft<cr>", "Decrease window width")

-- Buffers
map("n", "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", "Move to previous buffer")
map("n", "<S-l>", "<Cmd>BufferLineCycleNext<CR>", "Move to next buffer")
map("n", "<C-p>", "<Cmd>BufferLinePick<CR>", "Pick buffer")
map("n", "<leader>bb", "<Cmd>BufferLineCyclePrev<CR>", "Move to previous buffer")
map("n", "<leader>bn", "<Cmd>BufferLineCycleNext<CR>", "Move to next buffer")
map("n", "<leader>bc", "<Cmd>BufferLinePickClose<CR>", "Pick buffer to close")
map("n", "<leader>bd", ":lua MiniBufremove.delete()<CR>", "Close current buffer")

-- Swap buffers
map("n", "<leader>bh", splits.swap_buf_left, "Swap left")
map("n", "<leader>bj", splits.swap_buf_down, "Swap down")
map("n", "<leader>bk", splits.swap_buf_up, "Swap up")
map("n", "<leader>bl", splits.swap_buf_right, "Swap right")

-- Wezterm navigation
map({ "n", "t" }, "<C-h>", "<CMD>NavigatorLeft<CR>", "Move left")
map({ "n", "t" }, "<C-l>", "<CMD>NavigatorRight<CR>", "Move right")
map({ "n", "t" }, "<C-k>", "<CMD>NavigatorUp<CR>", "Move up")
map({ "n", "t" }, "<C-j>", "<CMD>NavigatorDown<CR>", "Move down")
