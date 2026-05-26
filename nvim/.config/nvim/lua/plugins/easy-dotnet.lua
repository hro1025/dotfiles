return {
  "GustavEikaas/easy-dotnet.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "mfussenegger/nvim-dap",
  },
  config = function()
    require("easy-dotnet").setup({
      lsp = {
        enabled = true,
        preload_roslyn = true,
      },
      debugger = {
        bin_path = nil, -- easy-dotnet handles this automatically
        auto_register_dap = true,
      },
    })
  end,
}
