return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "helix",
      delay = 0,
      spec = {
        -- Groups
        { "<leader>f", group = "find" },
        { "<leader>g", group = "git" },
        { "<leader>c", group = "code" },
        { "<leader>x", group = "diagnostics" },
        { "<leader>b", group = "buffer" },
        { "<leader>w", group = "windows" },
        { "<leader>t", group = "theme" },
        { "<leader>u", group = "ui" },
        { "<leader>q", group = "quit" },

        -- Explorer
        { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },

        -- File finding
        { "<leader>ff", function() Snacks.picker.files() end, desc = "Find File" },
        { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent Files" },
        { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },

        -- Code
        { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action" },
        { "<leader>cr", vim.lsp.buf.rename, desc = "Rename" },
        { "<leader>cd", vim.lsp.buf.definition, desc = "Go to Definition" },
        { "<leader>ch", vim.lsp.buf.hover, desc = "Hover Docs" },
        { "<leader>ci", vim.lsp.buf.implementation, desc = "Go to Implementation" },
        { "<leader>cf", function() require("conform").format() end, desc = "Format" },

        -- Buffers
        { "<leader>bd", ":bd<cr>", desc = "Delete Buffer" },
        { "<leader>bn", ":bnext<cr>", desc = "Next Buffer" },
        { "<leader>bp", ":bprev<cr>", desc = "Prev Buffer" },

        -- Windows
        { "<leader>wv", "<C-w>v", desc = "Split Vertical" },
        { "<leader>wh", "<C-w>s", desc = "Split Horizontal" },
        { "<leader>wq", "<C-w>q", desc = "Close Window" },
        { "<leader>ww", "<C-w>w", desc = "Switch Window" },

        -- Quit
        { "<leader>qq", ":qa<cr>", desc = "Quit All" },
        { "<leader>qw", ":wq<cr>", desc = "Save and Quit" },

        -- Save
        { "<leader>s", "<cmd>w<cr>", desc = "Save File" },

        -- UI
        { "<leader>un", function() Snacks.notifier.show_history() end, desc = "Notification History" },
        { "<leader>tt", ":Themery<cr>", desc = "Switch Theme" },
      },
    },
  }
}
