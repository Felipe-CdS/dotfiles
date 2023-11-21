let mapleader=" "
let g:user42 = "fcoutinh"
let g:mail42 = "felipe_coutinho@id.uff.br"

syntax on
set number
set relativenumber
set guicursor=
set showmatch "show matching brackets when text indicator is over them
set scrolloff=10 "Makes it so there are always 10 lines below my cursor 
set laststatus=2

set noswapfile

set tabstop=4 
set shiftwidth=4
set softtabstop=4 
set expandtab

set autoindent
set cindent
set wrap

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ayu-theme/ayu-vim'
call plug#end()

set termguicolors     " enable true colors support
let ayucolor="dark"   " for dark version of theme
colorscheme ayu

nnoremap <leader>pv :Vex<CR>
nnoremap <leader><CR> :so ~/.vimrc<CR>
nnoremap <C-p> :GFiles<CR> 
nnoremap <leader>pf :Files<CR>
