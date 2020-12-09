" General Settings
set encoding=utf-8
set clipboard=unnamed

set nu
set relativenumber
set spell spelllang=en_us
set spellfile=~/.vim/spell/en.utf-8.add

syntax enable 
filetype on 

set nocompatible
filetype plugin indent on

set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12

"Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
let g:SimpylFold_docstring_preview=1
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" You Complete Me
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>h  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Nerd Tree
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:NERDTreeGitStatusUseNerdFonts = 1
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
map <C-b> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim' " let Vundle manage Vundle

Bundle 'Valloric/YouCompleteMe'
Plugin 'tmhedberg/SimpylFold'
Plugin 'preservim/nerdtree'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'kien/ctrlp.vim'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'ryanoasis/vim-devicons'

call vundle#end()

" Color Scheme
let g:dracula_colorterm = 0
colorscheme dracula
color dracula
set background=dark

" Programming Languages 
" each languages has it own config

" Python
let python_highlight_all=1
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Front end shit
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2


" Troff | Groff
autocmd Filetype nroff map <buffer> <F9> :w<CR>:exec '!buildPDF.sh' shellescape(@%, 1)<CR>:silent !xdg-open out.pdf<CR>
autocmd Filetype nroff imap <buffer> <F9> <esc>:w<CR>:exec '!buildPDF.sh' shellescape(@%, 1)<CR>:silent !xdg-open out.pdf<CR>

