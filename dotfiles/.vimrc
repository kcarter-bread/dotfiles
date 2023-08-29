" Vundle Install section below 

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'dense-analysis/ale'
Plugin 'preservim/nerdtree'
Plugin 'frazrepo/vim-rainbow'
Plugin 'godlygeek/tabular'
Plugin 'preservim/vim-markdown'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'nathanaelkane/vim-indent-guides'

" All of your Plugins must be called before here 
call vundle#end()


" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing
set number
set cursorline
" set cursorcolumn " removed might delete later idk 
set incsearch
set ignorecase
set hlsearch
set wildmenu

" settings for lightline
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

" Declaring space as the leader key
let mapleader = " "


" This is broken right now might delete later idk 
" set timeoutlen 500 " Set timeout length to 500 ms

" Mapping leader key shortcuts like nerd tree etcetera 

" SEtting NerdTree Settings Leader key is space 
map <leader>t :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1 

map <leader>ter :terminal<CR>

let skip_defaults_vim=1

" sets <leader>gf to open up gitfiles in fzf  
map <leader>gf :GFiles<CR> 

" sets Indent Guides to be enabled at start
let g:indent_guides_enable_on_vim_startup = 1 

" sets colors for Indent Guides 
" let g:indent_guides_auto_colors = 0 
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=red ctermbg=3
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4


" Commented out for now maybe will revisit later idk felt cute 
" map leader ww to swap windows in split mode 
" map <leader>ww 

" Declaring ALE Global Variables
let g:ale_linters = {
      \   'python': ['pylint']
      \}


let g:ale_linters_explicit=1
let g:ale_lint_on_enter=0
let g:ale_lint_on_save=1
let g:ale_completion_enabled=1
" sets fixers to prettier then eslint 
let g:ale_fixers = ['prettier', 'eslint']
" allows fix on save with ale
let g:ale_fix_on_save=1
let g:ale_sign_error='●'
let g:ale_sign_warning='.'

" vim rainbow Global Variables 
" vim rainbow github.com/frazrepo/vim-rainbow
let g:rainbow_active=1

" Settings for lightline
let g:lightline = {
	\ 'coloscheme': 'solarized',
	\ }

" Python specific settings 
au BufNewFile, BufRead *.py
    \ set expandtab
    \ set autoindent
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4


syntax on
filetype plugin indent on
