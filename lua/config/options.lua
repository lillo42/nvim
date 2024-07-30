-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Use telescope
vim.g.lazyvim_picker = "telescope"

vim.opt.listchars:append({ space = "·" })
vim.opt.list = true
