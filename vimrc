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
    " Why is this not a built-in Vim script function?!
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
let g:go_def_mapping_enabled = 0 " prefer handling this by coc.vim

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'leafgarland/typescript-vim'
Plug 'jparise/vim-graphql'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'dense-analysis/ale'
Plug 'iberianpig/tig-explorer.vim'
Plug 'junegunn/goyo.vim'

let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\}
let g:ale_linters = {'go': ['gopls'], 'php': []}
let g:ale_fix_on_save = 1

let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1

call plug#end()
filetype plugin indent on

:source ~/.vim/config/coc.vim

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

" colors
" ----------------------------------------------------------
colorscheme ir_black
highlight Visual cterm=NONE ctermfg=white ctermbg=darkblue
highlight CursorLine ctermfg=10 " netrw highlight color

highlight clear SignColumn " remove gutter color

syntax off " no syntax highlighting

