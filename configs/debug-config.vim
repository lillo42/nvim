" mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)
" for normal mode - the word under the cursor
"nmap <Leader>di <Plug>VimspectorBalloonEval

" for visual mode, the visually selected text
"xmap <Leader>di <Plug>VimspectorBalloonEval

"nnoremap <F9> :call vimspector#Continue()<CR>
"nnoremap <F6> :call vimspector#ToggleBreakpoint()<CR>
"nnoremap <F7> :call vimspector#StepInto()<CR>
"nnoremap <F8> :call vimspector#StepOver()<CR>
"nnoremap <F5> :call vimspector#Stop()<CR>
"
nnoremap <F9> :lua require'dap'.continue()<CR>
nnoremap <F8> :lua require'dap'.step_over()<CR>
nnoremap <F7> :lua require'dap'.step_into()<CR>
nnoremap <F6> :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <F5> :lua require'dap'.terminate()<CR>
