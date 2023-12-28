return {
  {
    "folke/which-key.nvim",
    init = function ()
      vim.o.timeout = false
      vim.o.timeoutlen = 300
    end,
  }
}
