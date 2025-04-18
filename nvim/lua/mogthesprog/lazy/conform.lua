return {
  'stevearc/conform.nvim',
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      markdown = { "prettierd" },
      go = { 'goimports' },
    },
    -- Set default options
    default_format_ops = {
      lsp_format = "fallback",
    },
    -- Set up format-on-save
    format_on_save = {
      timeout_ms = 1000,
      lsp_format = "first",
    }
  }
}
