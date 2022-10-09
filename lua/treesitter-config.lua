require("nvim-treesitter.configs").setup {
   indent = {
    enable = true
  },
  -- A list of parser names, or "all"
  ensure_installed = { "c_sharp", "go", "gomod", "lua", "rust", "vim", "json", "http", "sql", "javascript", "typescript", "html", "css", "scss", "java", "bash", "yaml", "dockerfile", "python" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}
