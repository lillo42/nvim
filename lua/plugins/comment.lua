return {
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    lazy = true,
    opts = {
      enable_autcmd = true
    }
  },

  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      options = {
        custom_commentstring = function ()
          local api = require("ts_context_commentstring.internal")
          return api.calculate_commentstring() or vim.bo.commentstring
        end
      }
    }
  },

  {
    "echasnovski/mini.surround",
    event = "VeryLazy",
    opts = {},
    config = function ()
      require("mini.surround").setup()
    end
  }

}
