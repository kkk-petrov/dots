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

logo = logo .. "\n"
-- logo = string.rep("\n", 1) .. logo .. "\n"

return {
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				theme = "hyper",
				config = {
					header = vim.split(logo, "\n"),
					week_header = {
						enable = false,
					},
					hide = {
						statusline = false,
					},
					packages = { enabled = false },
					shortcut = {
						{
							desc = " Session",
							group = "Number",
							action = 'lua require("persistence").load()',
							key = "s",
						},
						{
							desc = "󰈙 New file",
							group = "Label",
							action = "ene | startinsert",
							key = "n",
						},
						{
							desc = " Files",
							group = "Label",
							action = "Telescope find_files",
							key = "f",
						},
						-- {
						--   desc = " Config",
						--   group = "@property",
						--   action = [[lua require("lazyvim.util").telescope.config_files()()]],
						--   key = "c",
						-- },
						{
							desc = " Update",
							group = "@property",
							action = "Lazy update",
							key = "u",
						},
						{
							desc = "󰗼 Quit",
							group = "@property",
							action = "qa",
							key = "q",
						},
					},
					footer = function()
						local stats = require("lazy").stats()
						local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
						return { "" }
						-- return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
					end,
				},
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
}
