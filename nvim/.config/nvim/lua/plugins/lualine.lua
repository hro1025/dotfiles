return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        theme = "tokyonight",
        globalstatus = true,
        disabled_filetypes = {
          statusline = { "dashboard", "snacks_dashboard" },
        },
      },
    },
  },
}
