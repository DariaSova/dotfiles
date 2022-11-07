syntax enable
syntax on
set nocompatible              " be iMproved, required
set number
set hidden
set nocp
set shell=/bin/zsh
set clipboard=unnamedplus
set clipboard^=unnamed
set mouse=r
set backspace=indent,eol,start
set laststatus=2
set statusline+=%F
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)
" remove scrossbar in vim gui
set guioptions=
" set term=xterm
set t_Co=256
" Set SPELLCHeCK YYAH
set spell spelllang=en_ca
let &t_Cs = "\e[6m"
let &t_Ce = "\e[24m"
hi SpellBad cterm=undercurl,bold
" set highlight SpellBad      ctermfg=Red         term=Reverse        guisp=Red       gui=undercurl   ctermbg=White
hi SpellBad gui=undercurl guisp=red term=undercurl cterm=undercurl
set autoread
set cursorline
set cursorcolumn
highlight CursorLine   cterm=NONE ctermbg=darkred ctermfg=blue guibg=darkred guifg=blue
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

xnoremap p pgvy

filetype plugin indent on
filetype on
filetype indent on
filetype plugin on

"terminal colors
let g:solarized_termcolors = 16
"set vim swap files directory
set directory^=$HOME/.vim/swap/
" Fzf search enable
set rtp+=/usr/local/opt/fzf

autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType eruby setlocal expandtab shiftwidth=2 tabstop=2

let g:snipMate = { 'snippet_version' : 1 }
" max text length
au BufRead,BufNewFile *.rb setlocal textwidth=120
" get rid of trailing whitespace on :w
autocmd BufWritePre * %s/\s\+$//e

" remap default leader key /
let mapleader = ","

" ============= Key remapping =====================
" jk is the most logical way to use the escape key. The hottest and smartest
" people do it.
inoremap jk <esc>
" remap splitting windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
" remap splits
nmap :vs :vsplit
nmap :s :split
" nnoremap <C-a> <C-w>
nnoremap ; :
" remap FZF key
nnoremap <silent> <C-z> :FZF<CR>
" remap buffer key
nnoremap <silent> <C-x> :Buffers<CR>

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
  \| endif

" ===================PlugIns=========================
call plug#begin('~/.vim/plugged')
" Ocean theme VS
Plug 'mhartington/oceanic-next'
" plugin on GitHub repo
Plug 'tpope/vim-fugitive'
" autocomplete
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'roxma/nvim-yarp'
Plug 'Shougo/deoplete.nvim'
" show git diif in vim
Plug 'airblade/vim-gitgutter'
Plug 'ascenator/L9', {'name': 'newL9'}
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
"" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
" Files structure tree
Plug 'scrooloose/nerdtree'
"" Quick comment toggling
Plug 'tpope/vim-commentary'
" Linter
Plug 'dense-analysis/ale'
Plug 'janko-m/vim-test'
call plug#end()

" ruby end matching
runtime macros/matchit.vim


" Ripgrep
let g:rg_highligh = 1

" remap Commentary key
noremap \ :Commentary<CR>
autocmd FileType ruby setlocal commentstring=#\ %s

" ================ BERDTree ================
map - :NERDTreeToggle<CR>
map ] :NERDTreeFind<CR>

" ================ SpellCheck ================
" Map spell check suggestion key
nnoremap <C-s> ea<C-X><C-S>
" Move up and down in auto complete with <c-j> and <c-k>
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" ================ FZF ================
" Customize fzf colours to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" ================ ALE ================
let g:ale_fixers = {
\  'ruby': [
\    'remove_trailing_lines',
\    'trim_whitespace',
\    'rubocop',
\    'sorbet',
\    'prettier',
\  ]
\}
let g:ale_linters = {'ruby': ['rubocop', 'ruby', 'sorbet', 'prettier']}
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ruby_indent_assignment_style = 'variable'
nmap <LEADER>af :ALEFix<CR>
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_save = 1
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️ '
" let g:ale_set_loclist = 1
let g:ruby_indent_access_modifier_style = 'normal'
let g:ruby_indent_assignment_style = 'variable'
let g:ruby_indent_block_style = 'do'
" =====================================

" ========= OceanicNext theme =========
if (has("termguicolors"))
  set termguicolors
 endif
colorscheme OceanicNext
set background=dark
let g:oceanic_next_terminal_italic = 1
let g:oceanic_next_terminal_bold = 1

" ============= ctags ================
" alternative setup: set tags^=./.git/tags;
set tags=tags;

" ============= deoplete =============
let g:deoplete#enable_at_startup = 1
" remap default deoplete automcoplete keys
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
" automatically close suggestion windows
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" test plugin"""""""""""""""""""""""""""""""""""""""""""
let test#strategy = "vimterminal"
let test#vim#term_position = "belowright"

nnoremap <leader>n :TestNearest <C-V><C-J> call ReturnFocus()<CR>
nnoremap <C>n :TestFile <C-V><C-J> call ReturnFocus()<CR>
nnoremap <C-f> :call WipeMatchingBuffers('term://')<CR>
function! ReturnFocus()
  exe 'resize ' . 60 * winheight(0) / 100
  wincmd p
  stopinsert
endfunction

" Running tests inside Vim 8
function! Vim8RunStrategy(cmd)
  call term_start(['/usr/local/bin/zsh', '-ic', a:cmd])
endfunction

let g:test#custom_strategies = {'vim8terminal': function('Vim8RunStrategy')}
let g:test#strategy = 'vim8terminal'
""==========


function! GetBufferList()
  return filter(range(1,bufnr('$')), 'buflisted(v:val)')
endfunction
function! GetMatchingBuffers(pattern)
  return filter(GetBufferList(), 'bufname(v:val) =~ a:pattern')
endfunction
function! WipeMatchingBuffers(pattern)
  let l:matchList = GetMatchingBuffers(a:pattern)
  let l:count = len(l:matchList)
  if l:count < 1
    echo 'No buffers found matching pattern ' . a:pattern
    return
  endif
  if l:count == 1
    let l:suffix = ''
  else
    let l:suffix = 's'
  endif
  exec 'bw! ' . join(l:matchList, ' ')
  echo 'Wiped ' . l:count . ' buffer' . l:suffix . ''
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
let test#enabled_runners = ["ruby#minitest", "ruby#rails"]
let g:test#runner_commands = ['Minitest', 'Mocha']
let test#ruby#minitest#options = '--verbose'
let test#strategy = "iterm"
let test#ruby#minitest#executable = 'bin/rake test'
""==== GIT status =================================
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}
