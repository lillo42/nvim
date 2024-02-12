return {
  {
    "Hoffs/omnisharp-extended-lsp.nvim",
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
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        omnisharp = {
          handlers = {
            ["textDocument/definition"] = function(...)
              return require("omnisharp_extended").handler(...)
            end,
          },
          keys = {
            {
              "gd",
              function()
                require("omnisharp_extended").telescope_lsp_definitions()
              end,
              desc = "Goto Definition",
            },
          },
          enable_roslyn_analyzers = true,
          organize_imports_on_format = true,
          enable_import_completion = true,
          on_new_config = function(new_config, _)
            -- Get the initially configured value of `cmd`
            new_config.cmd = { unpack(new_config.cmd or {}) }

            -- Append hard-coded command arguments
            table.insert(new_config.cmd, "-z") -- https://github.com/OmniSharp/omnisharp-vscode/pull/4300
            vim.list_extend(new_config.cmd, { "--hostPID", tostring(vim.fn.getpid()) })
            table.insert(new_config.cmd, "DotNet:enablePackageRestore=false")
            vim.list_extend(new_config.cmd, { "--encoding", "utf-8" })
            table.insert(new_config.cmd, "--languageserver")

            table.insert(new_config.cmd, "--debug")
            table.insert(new_config.cmd, "--verbose")

            if new_config.enable_editorconfig_support then
              table.insert(new_config.cmd, "FormattingOptions:EnableEditorConfigSupport=true")
            end

            if new_config.organize_imports_on_format then
              table.insert(new_config.cmd, "FormattingOptions:OrganizeImports=true")
            end

            if new_config.enable_ms_build_load_projects_on_demand then
              table.insert(new_config.cmd, "MsBuild:LoadProjectsOnDemand=true")
            end

            if new_config.enable_roslyn_analyzers then
              table.insert(new_config.cmd, "RoslynExtensionsOptions:EnableAnalyzersSupport=true")
            end

            if new_config.enable_import_completion then
              table.insert(new_config.cmd, "RoslynExtensionsOptions:EnableImportCompletion=true")
            end

            if new_config.sdk_include_prereleases then
              table.insert(new_config.cmd, "Sdk:IncludePrereleases=true")
            end

            if new_config.analyze_open_documents_only then
              table.insert(new_config.cmd, "RoslynExtensionsOptions:AnalyzeOpenDocumentsOnly=true")
            end

            -- Disable the handling of multiple workspaces in a single instance
            new_config.capabilities = vim.deepcopy(new_config.capabilities)
            new_config.capabilities.workspace.workspaceFolders = false -- https://https://github.com/OmniSharp/omnisharp-roslyn/issues/909github.com/OmniSharp/omnisharp-roslyn/issues/909
          end,
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
