-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
if vim.g.vscode then
  vim.cmd("nmap <leader>fc :e ~/.config/nvim/init.lua<cr>")
  vim.keymap.set("n", "zz", [[<cmd>call VSCodeNotify('editor.toggleFold')<cr>]])
  vim.keymap.set("n", "za", [[<cmd>call VSCodeNotify('editor.foldAll')<cr>]])
  vim.keymap.set("n", "zA", [[<cmd>call VSCodeNotify('editor.unfoldAll')<cr>]])
  vim.keymap.set("n", "<ESC>", [[<cmd>call VSCodeNotify('workbench.action.files.save')<cr>]])
end

vim.keymap.set("i", "jk", "<ESC>", { silent = true })
vim.keymap.set("n", ";", ",", { silent = true })
vim.keymap.set("n", "'", ";", { silent = true })
