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

" vundle
" ----------------------------------------------------------
" https://github.com/VundleVim/Vundle.vim
" run :PluginInstall or vim +PluginInstall +qall

filetype off " vundle requirement

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " let vundle manage vundle

Plugin 'tpope/vim-vinegar'
Plugin 'vim-airline/vim-airline'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

Plugin 'posva/vim-vue'
let g:vue_pre_processors = ['typescript', 'scss']

Plugin 'fatih/vim-go'
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

Plugin 'leafgarland/typescript-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'dense-analysis/ale'
Plugin 'iberianpig/tig-explorer.vim'

let g:ale_fixers = ['prettier', 'eslint']
let g:ale_linters = {'go': ['gopls']}
let g:ale_fix_on_save = 1

call vundle#end()
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
