-- Save
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>", { desc = "Save File" })
vim.keymap.set("i", "<C-s>", "<Esc><cmd>w<cr>", { desc = "Save File" })
vim.keymap.set("i", "<C-c>", "<Esc><cmd>w<cr>", { desc = "Save and Normal Mode" })

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })

-- Clear search highlight
vim.keymap.set("n", "<Esc>", ":noh<cr>", { desc = "Clear search highlight" })

-- Custom commands
vim.api.nvim_create_user_command("Home", function()
  vim.cmd("silent! %bd!")
  Snacks.dashboard()
end, {})
