return {
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
    config = function()
      vim.api.nvim_create_augroup("VimEnter", {
        callback = function()
          if vim.env.TMUX_PLUGIN_MANAGER_PATH then
            vim.loop.spawn(
              vim.env.TMUX_PLUGIN_MANAGER_PATH .. "/tmux-windows-name/scripts/renam_session_windows.py",
              {}
            )
          end
        end,
      })
    end,
  },
}
