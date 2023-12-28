-- NVim Tree
local api = require "nvim-tree.api"
vim.keymap.set("n", "<leader>ef", api.tree.focus, {})
vim.keymap.set("n", "<leader>ec", api.tree.close, {})
vim.keymap.set("n", "<leader>er", api.tree.reload, {})
vim.keymap.set("n", "<leader>el", api.tree.find_file, {})

-- Paste (Replace) without add to buffer
vim.keymap.set("x", "<leader>x", [["_dP]])

-- Map copy/paste from clipboard
vim.keymap.set({ "n", "v" }, "<leader>p", [["+P]]) -- paste
vim.keymap.set({ "n", "v" }, "<leader>d", [["+D]]) -- delete and transfer to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+Y]]) -- copy

-- Incremental selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


-- Telescope
local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescope.find_files, {})
vim.keymap.set("n", "<leader>fb", telescope.buffers, {})
vim.keymap.set("n", "<leader>fl", telescope.live_grep, {})

vim.keymap.set("n", "<leader>gf", telescope.git_files, {})
vim.keymap.set("n", "<leader>gs", telescope.git_status, {})
vim.keymap.set("n", "<leader>gb", telescope.git_branches, {})

vim.keymap.set("n", "<leader>lr", telescope.lsp_references, {})
vim.keymap.set("n", "<leader>li", telescope.lsp_implementations, {})
vim.keymap.set("n", "<leader>ld", telescope.lsp_document_symbols, {})
vim.keymap.set("n", "<leader>lc", telescope.lsp_incoming_calls, {})
vim.keymap.set("n", "<leader>lo", telescope.lsp_outgoing_calls, {})
vim.keymap.set("n", "<leader>lf", telescope.lsp_dynamic_workspace_symbols, {})

local dap = require("telescope").extensions.dap
vim.keymap.set("n", "<leader>fdb", dap.list_breakpoints, {})
vim.keymap.set("n", "<leader>fdv", dap.variables, {})

-- UndoTree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, {})

-- harpoon
local harpoon = require("harpoon")
vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
