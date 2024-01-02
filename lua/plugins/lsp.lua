return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    lazy = true,
    config = false,
    init = function()
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = true,
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*",
        build = "make install_jsregexp"
      },

      { "windwp/nvim-autopairs" },
    },
    config = function()
      -- Here is where you configure the autocompletion settings.
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_cmp()

      local cmp_autopairs = require("nvim-autopairs.completion.cmp")

      -- And you can configure cmp even more, if you want to.
      local cmp = require("cmp")
      local cmp_action = lsp_zero.cmp_action()

      cmp.event:on(
        "confirm_done",
        cmp_autopairs.on_confirm_done()
      )

      cmp.setup({
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
        },
        formatting = lsp_zero.cmp_format(),
        mapping = cmp.mapping.preset.insert({
          -- `Enter` key to confirm completion
          ["<CR>"] = cmp.mapping.confirm({ select = false }),

          -- Ctrl+Space to trigger completion menu
          ["<C-Space>"] = cmp.mapping.complete(),

          -- Navigate between snippet placeholder
          ["<C-f>"] = cmp_action.luasnip_jump_forward(),
          ["<C-b>"] = cmp_action.luasnip_jump_backward(),

          -- Scroll up and down in the completion documentation
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),

          -- Regular tab complete
          -- ["<Tab>"] = cmp_action.tab_complete(),
          -- ["<S-Tab>"] = cmp_action.select_prev_or_fallback(),
        })
      })
    end
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "williamboman/mason-lspconfig.nvim" },
    },
    opts = {
      servers = {
        eslint = {
          settings = {
            -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
            workingDirectory = { mode = "auto" },
          }
        }
      }
    },
    config = function()
      -- This is where all the LSP shenanigans will live
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({ buffer = bufnr })
      end)

      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = {
          "volar",
          "omnisharp",
          "gopls",
          "tsserver",
          "angularls",
        },
        automatic_installation = true,
        handlers = {
          lsp_zero.default_setup,

          omnisharp = function()
            require("lspconfig").omnisharp.setup({
              -- Enables support for roslyn analyzers, code fixes and rulesets.
              enable_roslyn_analyzers = true,

              -- Specifies whether 'using' directives should be grouped and sorted during
              -- document formatting.
              organize_imports_on_format = true,

              -- Enables support for showing unimported types and unimported extension
              -- methods in completion lists. When committed, the appropriate using
              -- directive will be added at the top of the current file. This option can
              -- have a negative impact on initial completion responsiveness,
              -- particularly for the first few completion sessions after opening a
              -- solution.
              enable_import_completion = true,
            })
          end
        }
      })
    end
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  }
}
