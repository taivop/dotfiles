set nocompatible              " be iMproved, required
filetype off                  " required
set encoding=utf-8

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/vim-colors-solarized
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Bundle 'edkolev/tmuxline.vim'


Plugin 'altercation/solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"leader
let mapleader = ","
map <leader>f :YcmCompleter FixIt<CR>
map <leader>g :YcmCompleter GoTo<CR>

let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_autoclose_preview_window_after_completion=1

set showcmd
syntax enable
autocmd FileType python syn match pythonStatement "\(\W\|^\)\@<=self\([\.,)]\)\@="

nmap <Right> >>
nmap <Left> <<
nmap <Down> ddp
nmap <Up> dd2kp

" Searching {{{
set incsearch                   " incremental searching
set showmatch                   " show pairs match
set hlsearch                    " highlight search results
set smartcase                   " smart case ignore
set ignorecase                  " ignore case letters
" }}}

set background=dark
colorscheme solarized
set t_Co=256

let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_theme = 'airline_visual'

set number			" Line numbers
set numberwidth=3

" YCM configuration
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

" Copy and pastes
set clipboard=unnamedplus

" {{{ Fix bracketed paste problem
" workaround for https://github.com/vim/vim/issues/1start671
if has("unix")
  let s:uname = system("echo -n \"$(uname)\"")
  if !v:shell_error && s:uname == "Linux"
    set t_BE=
  endif
endif
" }}}
