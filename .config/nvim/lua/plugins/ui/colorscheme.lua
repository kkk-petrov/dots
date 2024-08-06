return {
  {
    "catppuccin/nvim",
    dependencies = "f-person/auto-dark-mode.nvim",
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
      local adm = require("auto-dark-mode")
      adm.setup({
        update_interval = 1000,
        set_dark_mode = function()
          vim.api.nvim_set_option_value("background", "dark", {})
          vim.cmd("colorscheme catppuccin-mocha")
          vim.cmd("source ~/.config/nvim/lua/ui/highlights.lua")
        end,
        set_light_mode = function()
          vim.api.nvim_set_option_value("background", "light", {})
          vim.cmd("colorscheme catppuccin-latte")
        end,

      })
    end,
  },
}
