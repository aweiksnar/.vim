" .vimrc

set nocompatible " vim settings instead of vi settings
set number " line numbers
set nowrap " disable word wrapping
set autoread " reload files changed outside vim
set hlsearch " enable search highlighting
set laststatus=2 " always show status line
set clipboard=unnamed " use system clipboard
set backspace=indent,eol,start " allow backspace in insert mode

set noswapfile

syntax on " syntax highlighting

vnoremap <C-c> <Esc>

noremap <leader>ff :GFiles<CR>
noremap <leader>fb :Buffers<CR>

" vim-plog
" ----------------------------------------------------------
" https://github.com/junegunn/vim-plug
" run :PlugInstall or vim +PlugInstall +qall

" filetype off " plug requirement

" set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

Plug 'posva/vim-vue'
let g:vue_pre_processors = ['typescript', 'scss']

Plug 'fatih/vim-go'
let g:go_version_warning = 0
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

Plug 'leafgarland/typescript-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'dense-analysis/ale'
Plug 'iberianpig/tig-explorer.vim'
Plug 'junegunn/goyo.vim'

let g:ale_fixers = ['prettier', 'eslint']
let g:ale_linters = {'go': ['gopls']}
let g:ale_fix_on_save = 1

call plug#end()
filetype plugin indent on

" search
" ----------------------------------------------------------
:set ignorecase
:set smartcase

" whitespace
" ----------------------------------------------------------
set autoindent
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2

filetype plugin on
filetype indent on

" colors
" ----------------------------------------------------------
colorscheme ir_black
highlight Visual cterm=NONE ctermfg=white ctermbg=darkblue
highlight CursorLine ctermfg=10 " netrw highlight color
