return {
  {
    "lewis6991/gitsigns.nvim",
    config = function() 
      require("gitsigns").setup()
    end
  },

  { "tpope/vim-fugitive" },


  {
    "rbong/vim-flog",
    lazy = true,
    cmd = { "Flog", "Flogsplit", "Floggit" },
    dependencies = {
      "tpope/vim-fugitive",
    },
  },
}
