return {
  {
    "sudormrfbin/cheatsheet.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>?", "<cmd>Cheatsheet<cr>", desc = "Cheatsheet" },
    },
  }
}
