return {
  -- {
  --   "javiorfo/nvim-soil",
  --   -- lazy = true,
  --   opts = {
  --     puml_jar = "C:/ProgramData/chocolatey/lib/plantuml/tools/plantuml.jar",
  --   },
  -- },
  --
  -- -- Optional for puml syntax highlighting:
  -- { "javiorfo/nvim-nyctophilia" },
  {
    "weirongxu/plantuml-previewer.vim",
    dependencies = {
      { "tyru/open-browser.vim" },
      { "aklt/plantuml-syntax" },
    },
  },
}
