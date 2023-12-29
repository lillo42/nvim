-- Setup color scheme
vim.cmd.colorscheme('tokyonight')

-- Web dev icons
require("nvim-web-devicons").setup({
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  default = true
})
