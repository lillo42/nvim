" fzf
" https://github.com/preservim/nerdtree

nnoremap <Leader>ff :Telescope fd<CR>
nnoremap <Leader>fb :Telescope buffers<CR>
nnoremap <Leader>fl :Telescope live_grep<CR>

nnoremap <Leader>fgs :Telescope git_status<CR>
nnoremap <Leader>fgb :Telescope git_branches<CR>

nnoremap <Leader>lr :Telescope lsp_references<CR>
nnoremap <Leader>li :Telescope lsp_implementations<CR>
nnoremap <Leader>ld :Telescope lsp_document_symbols<CR>
nnoremap <Leader>lc :Telescope lsp_incoming_calls<CR>
nnoremap <Leader>lo :Telescope lsp_outgoing_calls<CR>
nnoremap <Leader>lf :Telescope lsp_dynamic_workspace_symbols<CR>
nnoremap <Leader>la :lua vim.lsp.buf.code_action({})<CR>

