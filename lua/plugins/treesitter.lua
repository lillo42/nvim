return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    dependencies = {
      {
       "nvim-treesitter/nvim-treesitter-textobjects",
       config = function()
          -- When in diff mode, we want to use the default
          -- vim text objects c & C instead of the treesitter ones.
         local move = require("nvim-treesitter.textobjects.move") ---@type table<string,fun(...)>
         local configs = require("nvim-treesitter.configs")
         for name, fn in pairs(move) do
           if name:find("goto") == 1 then
             move[name] = function(q, ...)
               if vim.wo.diff then
                 local config = configs.get_module("textobjects.move")[name] ---@type table<string,string>
                 for key, query in pairs(config or {}) do
                   if q == query and key:find("[%]%[][cC]") then
                     vim.cmd("normal! " .. key)
                     return
                   end
                 end
               end
              return fn(q, ...)
             end
           end
         end
       end,
      },

      { "windwp/nvim-ts-autotag" }
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        -- A list of parser names, or "all" (the five listed parsers should always be installed)
        ensure_installed = {
            "lua",
            "javascript",
            "typescript",
            "html",
            "go",
            "json",
            "yaml",
            "c_sharp",
            "markdown",
            "dockerfile"
        },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,

        highlight = {
          enable = true,

          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },
        incremental_selection = {
          enable  = true
        },
        textobjects = {
          move = {
            enable = true
          },
        },
        autotag = {
          enable = true
        },
      })
    end,
  },

  { "nvim-treesitter/nvim-treesitter-context" },
}
