" ALE
" https://github.com/dmerejkowsky/vim-ale

let g:ale_fix_on_save = 1

" Enable completion where available.
" This setting must be set before ALE is loaded.
" You should not turn this setting on if you wish to use ALE as a completion
" source for other completion plugins, like Deoplete
let g:ale_completion_enable = 0


let g:ale_linters = { 
\ 'cs': ['omniSharp'],
\ 'go': [ 'gofmt', 'goimports', 'gopls'],
\ 'python': ['flake8', 'pylint', 'black'],
\ }

let g:ale_fixers = {
\ 'python': ['yapf'],
\ 'cs': ['dotnet-format'],
\ }

