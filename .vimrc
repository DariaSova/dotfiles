set nocompatible              " be iMproved, required
set number
syntax on 
filetype plugin indent on    " required
filetype on " required
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
set clipboard=unnamed
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
" remap spliting windows 
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"Pathogen
execute pathogen#infect()

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" set ctrlP plugin
set runtimepath^=~/.vim/bundle/ctrlp.vim
" allow vim to jump through directories for ctags
set tags=tags;/
syntax enable
let g:solarized_termcolors = 16
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" Scala highlights
Plugin 'derekwyatt/vim-scala'
" neocomplete Plugin
Plugin 'Shougo/neocomplete.vim'
" show git diif in vim
Plugin 'airblade/vim-gitgutter'
" plugin from http://vim-scripts.org/vim/scripts.html
" Install L9 and avoid a Naming conflict if you've already
installed a
" different version somewhere else.
Plugin 'ascenator/L9', {'name': 'newL9'}
Bundle 'vim-ruby/vim-ruby'

call vundle#end()            " required

"Neocomplete configurations
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
" Move up and down in autocomplete with <c-j> and <c-k>
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>") 

