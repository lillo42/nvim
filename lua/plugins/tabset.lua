return {
  {
    "FotiadisM/tabset.nvim",
    config = function()
      require("tabset").setup({
        default = {
          tabwidth = 4,
          expandtab = true
        },
        languages = {
          {
            filetypes = { "lua", "json", "yaml" },
            config = {
              tabwidth = 2
            }
          }
        }
      })
    end,
  }
}
