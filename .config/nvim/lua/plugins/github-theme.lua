return {
  {
    "projekt0n/github-nvim-theme",
    lazy = false,
    priority = 1000,
    config = function()
      require("github-theme").setup({
        options = {
          transparent = true,
          palettes = {
            github_dark_colorblind = {
              bg1 = "#1B2E35",
            },
            github_dark = {
              bg1 = "#1B2E35",
            },
            github_dark_dimmed = {
              bg1 = "#1B2E35",
            },
          },
        },
      })

      vim.cmd("colorscheme github_dark_colorblind")
    end,
  },
}
