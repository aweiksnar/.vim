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

function! s:get_visual_selection()
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction

vnoremap <C-c> <Esc>

noremap <leader>ff :GFiles<CR>
noremap <leader>fb :Buffers<CR>

" https://stackoverflow.com/questions/17838700/vimscript-get-visual-mode-selection-text-in-mapping
" TODO update to make case insensitive ex: /<term>/i ?
noremap <leader>gg <Esc>:Ggrep <C-R><C-R>=<SID>get_visual_selection()<CR>

" vim-plog
" ----------------------------------------------------------
" https://github.com/junegunn/vim-plug
" run :PlugInstall or vim +PlugInstall +qall
" filetype off " plug requirement

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1

call plug#end()
filetype plugin indent on

" search
" ----------------------------------------------------------
:set ignorecase
:set smartcase

" press // to search for currently highlighted text
" https://vim.fandom.com/wiki/Search_for_visually_selected_text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" whitespace
" ----------------------------------------------------------
set autoindent
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2

filetype plugin on
filetype indent on


syntax off " no syntax highlighting

