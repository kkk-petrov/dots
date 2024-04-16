local map = require("utils").map
local ufo = require("ufo")

-- Better indenting
map("v", "<", "<gv", "Indent right")
map("v", ">", ">gv", "Indent left")

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", "Escape and clear hlsearch")

-- Move visual
map("v", "<A-j>", "<Plug>GoVSMDown", "Move visual down")
map("v", "<A-k>", "<Plug>GoVSMUp", "Move visual up")
map("v", "<A-h>", "<Plug>GoVSMLeft", "Move visual left")
map("v", "<A-l>", "<Plug>GoVSMRight", "Move visual right")

-- Folds
map("n", "zR", ufo.openAllFolds, "Open all folds")
map("n", "zM", ufo.closeAllFolds, "Close all folds")
