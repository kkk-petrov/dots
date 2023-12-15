-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  command = "so ~/.vimrc",
})
