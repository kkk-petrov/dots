local logo = [[
                                          _.oo.
                  _.u[[/;:,.         .odMMMMMM'
               .o888UU[[[/;:-.  .o@P^    MMM^
              oN88888UU[[[/;::-.        dP^
             dNMMNN888UU[[[/;:--.   .o@P^
            ,MMMMMMN888UU[[/;::-. o@^
            NNMMMNN888UU[[[/~.o@P^
            888888888UU[[[/o@^-..
           oI8888UU[[[/o@P^:--..
        .@^  YUU[[[/o@^;::---..
      oMP     ^/o@P^;:::---..
   .dMMM    .o@^ ^;::---...
  dMMMMMMM@^`       `^^^^
 YMMMUP^

]]

-- logo = logo .. "\n"
logo = string.rep("\n", 2) .. logo .. "\n"

return {}
--
-- return {
-- 	{
-- 		"nvimdev/dashboard-nvim",
-- 		event = "VimEnter",
-- 		config = function()
-- 			require("dashboard").setup({
-- 				theme = "hyper",
-- 				config = {
-- 					header = vim.split(logo, "\n"),
-- 					week_header = {
-- 						enable = true,
-- 					},
-- 					hide = {
-- 						statusline = false,
-- 					},
-- 					packages = { enabled = false },
-- 					shortcut = {
-- 						{
-- 							desc = " Session",
-- 							group = "Number",
-- 							action = 'lua require("persistence").load()',
-- 							key = "s",
-- 						},
-- 						{
-- 							desc = "󰈙 New file",
-- 							group = "Label",
-- 							action = "ene | startinsert",
-- 							key = "n",
-- 						},
-- 						{
-- 							desc = " Files",
-- 							group = "Label",
-- 							action = "Telescope find_files",
-- 							key = "f",
-- 						},
-- 						{
-- 							desc = " Update",
-- 							group = "@property",
-- 							action = "Lazy update",
-- 							key = "u",
-- 						},
-- 						{
-- 							desc = "󰗼 Quit",
-- 							group = "@property",
-- 							action = "qa",
-- 							key = "q",
-- 						},
-- 					},
-- 				},
-- 			})
-- 		end,
-- 		dependencies = { { "nvim-tree/nvim-web-devicons" } },
-- 	},
-- }
