return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        cs = { "csharpier" },
        rust = { "rustfmt" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
      },
      formatters = {
        prettier = {
          command = "/home/roan/.npm-global/bin/prettier",
        },
      },
    },
  },
}
