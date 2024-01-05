local Util = require("util")

-- Paste (Replace) without add to buffer
vim.keymap.set("x", "<leader>x", [["_dP]])

-- Map copy/paste from clipboard
vim.keymap.set({ "n", "v" }, "<leader>p", [["+P]]) -- paste
vim.keymap.set({ "n", "v" }, "<leader>d", [["+D]]) -- delete and transfer to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+Y]]) -- copy

-- Incremental selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- buffer
vim.keymap.set("n", "<C-p>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<C-n>", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- Clear search
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- save file
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Nvim Tree
vim.keymap.set("n", "<leader>ef", function()
  local api = require("nvim-tree.api")
  api.tree.reload()
  api.tree.find_file()
  api.tree.focus()
end, { desc = "Open File System" })

vim.keymap.set("n", "<leader>ec", function()
  local api = require("nvim-tree.api")
  api.tree.close()
end, { desc = "Close File System" })

-- UndoTree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undo system" })

-- Telescope
local telescope = require("telescope.builtin")

-- TODO: When find by file use the "telescope function" in utils
vim.keymap.set("n", "<leader>ff", Util.telescope.telescope("files", { desc = "Find file" }))
vim.keymap.set("n", "<leader>fb", telescope.buffers, { desc = "Find buffer" })
vim.keymap.set("n", "<leader>fl", telescope.live_grep, { desc = "Find inside file" })

-- vim.keymap.set("n", "<leader>gf", telescope.git_files, {})
vim.keymap.set("n", "<leader>gs", telescope.git_status, { desc = "Git status" })
vim.keymap.set("n", "<leader>gb", telescope.git_branches, { desc = "Git branches" })

vim.keymap.set("n", "<leader>lr", telescope.lsp_references, { desc = "Find all reference" })
vim.keymap.set("n", "<leader>li", telescope.lsp_implementations, { desc = "Go to implementation" })
vim.keymap.set("n", "<leader>ld", telescope.lsp_document_symbols, { desc = "Documen symbol" })
vim.keymap.set("n", "<leader>lc", telescope.lsp_incoming_calls, { desc = "Incoming calls" })
vim.keymap.set("n", "<leader>lo", telescope.lsp_outgoing_calls, { desc = "Outcoming calls" })
vim.keymap.set("n", "<leader>lf", telescope.lsp_dynamic_workspace_symbols, { desc = "Find in workspace" })

local dap = require("telescope").extensions.dap
vim.keymap.set("n", "<leader>fdb", dap.list_breakpoints, { desc = "List breaking points" })
vim.keymap.set("n", "<leader>fdv", dap.variables, { desc = "List all variables" })

-- harpoon
local harpoon = require("harpoon")
vim.keymap.set("n", "<leader>ha", function()
  harpoon:list():append()
end, { desc = "Add harpoon" })
vim.keymap.set("n", "<leader>hl", function()
  local conf = require("telescope.config").values
  local file_paths = {}
  local harpoon_files = harpoon:list()
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require("telescope.pickers")
    .new({}, {
      prompt_title = "Harpoon",
      finder = require("telescope.finders").new_table({
        results = file_paths,
      }),
      previewer = conf.file_previewer({}),
      sorter = conf.generic_sorter({}),
    })
    :find()
end, { desc = "Open harpoon window" })

vim.keymap.set("n", "<leader>h1", function()
  harpoon:list():select(1)
end, { desc = "Go to Harpoon 1" })
vim.keymap.set("n", "<leader>h2", function()
  harpoon:list():select(2)
end, { desc = "Go to Harpoon 2" })
vim.keymap.set("n", "<leader>h3", function()
  harpoon:list():select(3)
end, { desc = "Go to Harpoon 3" })
vim.keymap.set("n", "<leader>h4", function()
  harpoon:list():select(4)
end, { desc = "Go to Harpoon 4" })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<leader>hp", function()
  harpoon:list():prev()
end, { desc = "Go to prev harpoon" })
vim.keymap.set("n", "<leader>hn", function()
  harpoon:list():next()
end, { desc = "Got to next harpoon" })

-- Terminal
local terminal = require("toggleterm")
vim.keymap.set("n", "<leader>tt", terminal.toggle, {})

-- Git
-- vim.keymap.set("n", "<leader>gs", "<cmd>Git status<cr>", { desc = "Git status" })
vim.keymap.set("n", "<leader>ga", "<cmd>Git add .<cr>", { desc = "Git add" })
vim.keymap.set("n", "<leader>gc", function()
  local message = vim.fn.input("Commit message: ")
  if message == "" then
    return
  end

  vim.cmd('Git commit -m "' .. message .. '"')
end, { desc = "Git commit" })
