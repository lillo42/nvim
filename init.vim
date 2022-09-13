set rnu
set number
set encoding=utf-8

call plug#begin('~/.config/nvim/plugged')
" The default plugin directory will be as follows:
"  - Vim (Linux/macOS): '~/.vim/plugged'
"  - Vim (Windows): '~/vimfiles/plugged'
"  - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
"
" You can specify a custom plugin directory by passing it as the argument
"  - e.g. `call plug#begin('~/.vim/plugged')`
"  - Avoid using standard Vim directory names like 'plugin'

" tmux
Plug 'christoomey/vim-tmux-navigator'

" Config per project
Plug 'windwp/nvim-projectconfig'

" Git
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'

" Color schema
Plug 'sainnhe/gruvbox-material'
Plug 'gruvbox-community/gruvbox'

" .editorconfig
Plug 'editorconfig/editorconfig-vim'

" File System
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'LinArcX/telescope-env.nvim'

" Code actions, highlight & find symbols
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'nickspoons/vim-sharpenup'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'github/copilot.vim'

" LSP
Plug 'neovim/nvim-lspconfig'

" Debugger 
Plug 'puremourning/vimspector'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'

" Database
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'

" HTTP 
Plug 'nvim-lua/plenary.nvim'
Plug 'rest-nvim/rest.nvim'

" Languages
Plug 'OmniSharp/omnisharp-vim'
"Plug 'fatih/vim-go'
Plug 'ray-x/go.nvim'

" Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'

call plug#end()

let mapleader=","

set background=dark

colorscheme gruvbox-material

let g:gruvbox_material_background = 'hard'

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
      autocmd!
      autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif


" Configs
source ~/.config/nvim/configs/nerdtree-config.vim
source ~/.config/nvim/configs/fzf-config.vim
source ~/.config/nvim/configs/ale-config.vim
source ~/.config/nvim/configs/omnisharp-config.vim
source ~/.config/nvim/configs/golang-config.vim
source ~/.config/nvim/configs/ultisnips-config.vim
source ~/.config/nvim/configs/vimspector-config.vim

lua <<EOF

require("treesitter-config")
require("telescope-config")
require("dap-config")
require("devicons-config")
require("lsp-config")
require("rest-nvim").setup({})
require("go").setup()


EOF

"set foldmethod=expr
"set foldexpr=nvim_treesitter#foldexpr()

