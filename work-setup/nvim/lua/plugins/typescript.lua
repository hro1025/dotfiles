return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {},
        -- Disable other TS servers if desired
        vtsls = { enabled = false },
        ts_ls = { enabled = false },
      },
    },
  },
}
