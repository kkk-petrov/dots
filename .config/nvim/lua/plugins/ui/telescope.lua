return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("projects")
			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("file_browser")
			require("telescope").load_extension("rest")
		end,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
}
