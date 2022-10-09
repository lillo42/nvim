set rnu
set number
set encoding=utf-8
set foldmethod=syntax
set nocompatible

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
Plug 'tpope/vim-commentary'

" File System
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Comment
Plug 'tpope/vim-commentary'

" Telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'LinArcX/telescope-env.nvim'
Plug 'ThePrimeagen/git-worktree.nvim'
Plug 'ThePrimeagen/harpoon'

" Code actions, highlight & find symbols
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'nickspoons/vim-sharpenup'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'github/copilot.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'Hoffs/omnisharp-extended-lsp.nvim'

" Debugger 
Plug 'puremourning/vimspector'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'

" Database
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'kristijanhusak/vim-dadbod-completion'

" HTTP 
Plug 'nvim-lua/plenary.nvim'
Plug 'rest-nvim/rest.nvim'

" Languages
Plug 'OmniSharp/omnisharp-vim'

" Go
Plug 'ray-x/go.nvim'
Plug 'leoluz/nvim-dap-go'

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
source ~/.config/nvim/configs/telescope-config.vim
source ~/.config/nvim/configs/ale-config.vim
source ~/.config/nvim/configs/omnisharp-config.vim
source ~/.config/nvim/configs/golang-config.vim
source ~/.config/nvim/configs/json-config.vim
source ~/.config/nvim/configs/ultisnips-config.vim
source ~/.config/nvim/configs/debug-config.vim
source ~/.config/nvim/configs/coc-config.vim
source ~/.config/nvim/configs/window-config.vim
source ~/.config/nvim/configs/rest-config.vim

lua <<EOF

require("treesitter-config")
require("telescope-config")
require("dap-config")
require("devicons-config")
require("lsp-config")
require("git-worktree").setup({})
require("rest-nvim").setup({ result_split_in_place=true })
require("go").setup()

EOF
