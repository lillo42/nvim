-- Setup color scheme
vim.cmd.colorscheme("tokyonight")

-- Setup fold method
vim.opt.foldmethod = "expr"
vim.foldexpr = "nvim_treesitter#foldexpr()"

-- vim.lsp.set_log_level("TRACE")

