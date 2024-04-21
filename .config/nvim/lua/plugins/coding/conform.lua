return {
  'stevearc/conform.nvim',
  opts = {

    formatters_by_ft = {
      css = { { "prettied", "prettier" } },
      graphql = { { "prettied", "prettier" } },
      html = { { "prettied", "prettier" } },
      javascript = { { "prettied", "prettier" } },
      javascriptreact = { { "prettied", "prettier" } },
      json = { { "prettied", "prettier" } },
      lua = { "stylua" },
      markdown = { { "prettied", "prettier" } },
      python = { "isort", "black" },
      sql = { "sql-formatter" },
      svelte = { { "prettied", "prettier" } },
      typescript = { { "prettied", "prettier" } },
      typescriptreact = { { "prettied", "prettier" } },
      yaml = { "prettier" },
    },
    format_on_save = {
      lsp_fallback = true,
      timeout_ms = 500,
    },
    format_after_save = {
      lsp_fallback = true,
    },
  },
  config = function(_, opts)
    vim.api.nvim_create_user_command("Format", function(args)
      local range = nil
      if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end

      require("conform").format({ async = true, lsp_fallback = true, range = range })
    end, { range = true })
    require("conform").setup(opts)
  end
}
