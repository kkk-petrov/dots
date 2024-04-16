local map = require("utils").map
local ls = require("luasnip")

map("n", "<leader>uh", "<cmd>ColorizerToggle<CR>", "Toggle colorizer")
map("n", "<leader>uc", "<cmd>Telescope colorscheme<CR>", "Colorscheme")

-- Lazy
map("n", "<leader>l", "<cmd>Lazy<CR>", "Lazy")

-- Mason
map("n", "<leader>m", "<cmd>Mason<CR>", "Mason")

-- Save on CTRL + S
map({ "n", "i", "v" }, "<C-s>", "<Esc><cmd>w<CR>", "Save")

-- Translate
map("x", "<leader>tr", "<CMD>Translate ru<CR>", "Translate to russian")
map("x", "<leader>te", "<CMD>Translate en<CR>", "Translate to english")

-- CodeSnap
map("x", "<leader>cs", ":CodeSnap<CR>", "CodeSnap")

-- Zen mode
map("n", "<leader>z", "<cmd>ZenMode<CR>", "Zen mode")

-- Luasnip
map({ "i" }, "<C-l>", function()
	ls.expand_or_jump()
end, "Jump forward or expand a snippet")

map({ "i", "s" }, "<C-h>", function()
	ls.jump(-1)
end, "Jump backward")

map({ "i", "s" }, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, "Change active choise")
