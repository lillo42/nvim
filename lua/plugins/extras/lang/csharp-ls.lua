return {
  {
    "Decodetalkers/csharpls-extended-lsp.nvim",
    lazy = true,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "c_sharp" })
      end
    end,
  },

  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = opts.sources or {}
      table.insert(opts.sources, nls.builtins.formatting.csharpier)
    end,
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        cs = { "csharpier" },
      },
      formatters = {
        csharpier = {
          command = "dotnet-csharpier",
          args = { "--write-stdout", "--no-cache", "$FILENAME" },
        },
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "csharpier")
      table.insert(opts.ensure_installed, "csharp-language-server")
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opt = {
      servers = {
        csharp_ls = {
          handlers = {
            ["textDocument/definition"] = function(...)
              return require("csharpls_extended").handler(...)
            end,

            ["textDocument/typeDefinition"] = function(...)
              return require("csharpls_extended").handler(...)
            end,
          },
        },
      },
    },
  },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "Issafalcon/neotest-dotnet",
    },
    opts = {
      adapters = {
        ["neotest-dotnet"] = {
          -- Here you can specify the settings for the adapter, i.e.
          -- runner = "pytest",
          -- python = ".venv/bin/python",
        },
      },
    },
  },
}
