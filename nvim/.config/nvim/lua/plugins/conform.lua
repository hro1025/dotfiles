return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = {
      formatters = {
        prettier = {
          command = "/home/roan/.npm-global/bin/prettier",
        },
      },
      formatters_by_ft = {
        cs = { "csharpier" },
        lua = { "stylua" },
        sh = { "shfmt" },
        xml = { "prettier" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
  },
}
