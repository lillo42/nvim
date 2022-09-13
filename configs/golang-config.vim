" Golang

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 
autocmd BufWritePre *.go :silent! lua require('go.format').goimport()

