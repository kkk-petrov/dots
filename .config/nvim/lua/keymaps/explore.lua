local map = require("utils").map
local telescope = require("telescope.builtin")

-- File explorer
map("n", "<leader>e", "<cmd>Neotree reveal_force_cwd filesystem toggle<CR>", "Explorer")

-- Telescope
map("n", "<leader>/", "<cmd>Telescope file_browser path=%:p:h=%:p:h<cr>", "Browse files")
map("n", "<leader><Space>", telescope.resume, "Resume last search")
map("n", "<leader>F", telescope.live_grep, "Live grep")
map("n", "<leader>fl", telescope.live_grep, "Live grep")
map("n", "<leader>ff", telescope.find_files, "Find files")
map("n", "<leader>fb", telescope.buffers, "Buffers")
map("n", "<leader>fh", telescope.help_tags, "Help")
map("n", "<leader>fm", telescope.man_pages, "Man")
map("n", "<leader>fk", telescope.keymaps, "Keymaps")
map("n", "<leader>fs", telescope.spell_suggest, "Spell suggestions")

-- Git
map("n", "<leader>gg", telescope.git_files, "Git files")
map("n", "<leader>gs", telescope.git_status, "Git status")
map("n", "<leader>gc", telescope.git_commits, "Git commits")
map("n", "<leader>gC", telescope.git_bcommits, "Git bcommits")
map("n", "<leader>gb", telescope.git_bcommits, "Git branches")
map("n", "<leader>gt", telescope.git_stash, "Git stash")

-- Aerial
map("n", "<leader>a", "<cmd>AerialToggle! right<CR>", "Aerial")
map("n", "{", "<cmd>AerialPrev<CR>", "Aerial previous")
map("n", "}", "<cmd>AerialNext<CR>", "Aerial next")

-- Create new file
map("n", "<leader>fn", "<cmd>enew<cr>", "New file")
