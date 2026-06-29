return {
  {
    "seblj/roslyn.nvim",
    ft = "cs",
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("lemminx", {
        cmd = { "lemminx" },
        filetypes = { "xml" },
      })
      vim.lsp.enable("lemminx")
    end,
  },
}
