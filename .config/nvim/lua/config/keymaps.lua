-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- telescope resume
vim.keymap.set(
  "n",
  "<leader>sx",
  require("telescope.builtin").resume,
  { noremap = true, silent = true, desc = "Resume" }
)

-- rest
vim.keymap.set("n", "<leader>hh", "<Plug>RestNvim", { noremap = true, silent = true, desc = "Rest Client" })
vim.keymap.set("n", "<leader>hp", "<Plug>RestNvimPreview", { noremap = true, silent = true, desc = "Preview request" })
vim.keymap.set("n", "<leader>hl", "<plug>restnvimlast", { noremap = true, silent = true, desc = "last request" })

-- nvim-spider
vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "spider-b" })

-- dashboard
vim.keymap.set("n", "<leader>D", "<cmd>Dashboard<CR>", { noremap = true, silent = true, desc = "Dashboard" })
