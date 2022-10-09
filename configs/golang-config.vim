" Golang
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 
autocmd BufWritePre *.go :GoImport

augroup golang_commands
  autocmd!

  autocmd FileType go nmap <silent> <Leader>tm :lua require('dap-go').debug_test()
augroup END
