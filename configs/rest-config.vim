" HTTP

augroup http_commands
  autocmd!
  
  autocmd FileType http nmap <silent> <Leader>r :lua require('rest-nvim').run()<CR>
augroup END
