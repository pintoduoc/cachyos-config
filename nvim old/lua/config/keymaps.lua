-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

--Arrow
local arrowKeys = { "<Up>", "<Down>", "<Left>", "<Right>" }
for _, key in ipairs(arrowKeys) do
  vim.keymap.set({ "n", "i", "v", "x" }, key, "<Nop>", { desc = "Arrow key disabled" })
end
