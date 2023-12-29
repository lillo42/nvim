return {
  -- {
  --   "willothy/wezterm.nvim",
  --   config = true,
  --   enable = false
  -- }
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function ()
     require("toggleterm").setup()
    end
  }
}
