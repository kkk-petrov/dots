-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set(
  "n",
  "<leader>sx",
  require("telescope.builtin").resume,
  { noremap = true, silent = true, desc = "Resume" }
)

vim.keymap.set("n", "gtd", function()
  vim.cmd("lua require('omnisharp_extended').lsp_definitions()")
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>hh", "<Plug>RestNvim", { noremap = true, silent = true, desc = "Rest Client" })
vim.keymap.set("n", "<leader>hp", "<Plug>RestNvimPreview", { noremap = true, silent = true, desc = "Preview request" })
vim.keymap.set("n", "<leader>hl", "<Plug>RestNvimLast", { noremap = true, silent = true, desc = "Last request" })
