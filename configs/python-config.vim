" Python

au BufNewFile,BufRead *.py
  \ set expandtab       |" replace tabs with spaces
  \ set autoindent      |" copy indent when starting a new line
  \ set tabstop=4
  \ set softtabstop=4
  \ set shiftwidth=4

autocmd BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'Pipfile']

let g:ale_python_auto_pipenv=1
let g:ale_python_black_auto_pipenv=1
let g:ale_python_flake8_auto_pipenv=1


augroup py_commands
  autocmd!

  autocmd FileType python nmap <Leader>tm :lua require('dap-python').test_method()<CR>
  autocmd FileType python nmap <Leader>tm :lua require('dap-python').test_class()<CR>
augroup END

py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
