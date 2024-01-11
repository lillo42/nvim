local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath
  })
end

vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    { import = "plugins" },
    { import = "plugins.extras.formatting" },
    { import = "plugins.extras.linting" },
    { import = "plugins.extras.lang" },
    { import = "plugins.extras.lsp" },
    { import = "plugins.extras.dap" },
    { import = "plugins.extras.tests" },
    { import = "plugins.extras.editor" },
    { import = "plugins.extras.coding" },
  },
  defaults = {
    lazy = false,

    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = true }, -- automatically check for plugin updates
})
