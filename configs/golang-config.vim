" Golang

autocmd BufRead,BufNewFile *.go set filetype=go 
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 
autocmd BufWritePre *.go :silent! lua require('go.format').goimport()

"let g:go_highlight_generate_tags = 1
"let g:go_auto_sameids = 1

"let g:go_auto_type_info = 1

"let g:go_fmt_autosave = 1

"augroup golang_commands
"	autocmd!
"	autocmd FileType go nmap <buffer> <Leader>rn :GoRename<CR>
"augroup END
