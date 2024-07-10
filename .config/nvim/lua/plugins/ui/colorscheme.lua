return {
  "catppuccin/nvim",
  priority = 1000,
  opts = {
    flavor = "mocha",
    background = {
      light = "latte",
      dark = "mocha",
    },
    transparent_background = true,
    default_integrations = true, -- cdd6f4
    dim_inactive = {
      enabled = false,
      shade = "dark",
      percentage = 0.15,
    },
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      treesitter = true,
      fidget = true,
      mason = true,
      neotree = true,
      ufo = true,
      lsp_trouble = false,
      which_key = true,
      dap = true,
      dap_ui = true,
      illuminate = {
        enabled = true,
        lsp = true,
      },
      mini = {
        enabled = false,
      },
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
        },
        inlay_hints = {
          background = true,
        },
      },
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd("colorscheme catppuccin-mocha")
  end,
}
