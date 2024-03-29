local Utils = require("util")

local M = {}

---@param opts ConformOpts
function M.setup(_, opts)
  for name, formatter in pairs(opts.formatters or {}) do
    if type(formatter) == "table" then
      ---@diagnostic disable-next-line: undefined-field
      if formatter.extra_args then
        ---@diagnostic disable-next-line: undefined-field
        formatter.prepend_args = formatter.extra_args
        Utils.deprecate(("opts.formatters.%s.extra_args"):format(name), ("opts.formatters.%s.prepend_args"):format(name))
      end
    end
  end

  for _, keys in pairs({ "format_on_save", "format_after_save" }) do
    if opts[keys] then
      Utils.warn(
        ("Don't set `opts.%s` for `conform.nvim`.\n**LazyVim** will use the conform formatter automatically"):format(
          keys
        )
      )
      ---@diagnostic disable-next-line: no-unknown
      opts[keys] = nil
    end
  end

  require("conform").setup(opts)
end


return {
  {
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim" },
    lazy = true,
    cmd = "ConformInfo",
    keys = {
      {
        "<leader>cF",
        function()
          require("conform").format({ formatters = { "injected" } })
        end,
        mode = { "n", "v" },
        desc = "Format Injected Langs",
      }
    },
    init = function()
      require("util").on_very_lazy(function()
        require("util").format.register({
          name = "conform.nvim",
          priority = 100,
          primary = true,
          format = function(buf)
            local plugin = require("lazy.core.config").plugins["conform.nvim"]
            local Plugin = require("lazy.core.plugin")
            local opts = Plugin.values(plugin, "opts", false)
            require("conform").format(Utils.merge(opts, { bufnr = buf }))
          end,
          sources = function(buf)
            local ret = require("conform").list_formatters(buf)
            --@param v conform.FormatterInfo
            return vim.tbl_map(function (v)
              return v.nama
            end, ret)
          end,
        })
      end)
    end,
    opts = function()
    local plugin = require("lazy.core.config").plugins["conform.nvim"]
      if plugin.config ~= M.setup then
        Utils.error({
          "Don't set `plugin.config` for `conform.nvim`.\n",
          "This will break **LazyVim** formatting.\n",
          "Please refer to the docs at https://www.lazyvim.org/plugins/formatting",
        }, { title = "LazyVim" })
      end

      ---@class ConformOpts
      return {
        -- LazyVim will use these options when formatting with the conform.nvim formatter
        format = {
          timeout_ms = 3000,
          async = false, -- not recommended to change
          quiet = false, -- not recommended to change
        },

        ---@type table<string, conform.FormatterUnit[]>
        formatters_by_ft = {
          lua = { "stylua" },
          fish = { "fish_indent" },
          sh = { "shfmt" },
        },

        -- The options you set here will be merged with the builtin formatters.
        -- You can also define any custom formatters here.
        ---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
        formatters = {
          injected = { options = { ignore_errors = true } },
          -- # Example of using dprint only when a dprint.json file is present
          -- dprint = {
          --   condition = function(ctx)
          --     return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
          --   end,
          -- },
          --
          -- # Example of using shfmt with extra args
          -- shfmt = {
          --   prepend_args = { "-i", "2", "-ci" },
          -- },
        },
      }
    end,
    config = M.setup,
  }
}
