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

Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/solarized'

Plugin 'Yggdroot/indentLine'

Plugin 'AndrewRadev/switch.vim'

Plugin 'godlygeek/tabular'

" Highlighting support for various languages
Plugin 'nathanielc/vim-tickscript'
Plugin 'hashivim/vim-terraform'

" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'


" NERDTree
Plugin 'https://github.com/scrooloose/nerdtree.git'

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

"https://stackoverflow.com/questions/4597721/syntax-highlight-for-ejs-files-in-vim
au BufNewFile,BufRead *.ejs set filetype=html

"leader
let mapleader = ","
map <leader>f :YcmCompleter FixIt<CR>
map <leader>g :YcmCompleter GoTo<CR>

" compilation
noremap <Leader>b :w <bar> !make -C $(sed 's.src.build.g' <<< $(pwd)) --no-print-directory -j4<cr>

let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_autoclose_preview_window_after_completion=1

" Ultisnips
" Trigger configuration. Do not use <tab> if you use
let g:UltiSnipsExpandTrigger="<leader><leader>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-l>"
let g:snips_author = 'Taivo Pungas'
let g:snips_email = 'taivo.pungas@starship.xyz'
let g:snips_github = 'taivop'
let g:ultisnips_python_style = 'numpy'

" Nerdtree
noremap <leader>n :NERDTreeToggle<cr>

set showcmd
syntax enable
autocmd FileType python syn match pythonStatement "\(\W\|^\)\@<=self\([\.,)]\)\@="

nmap <Right> >>
nmap <Left> <<
nmap <Down> ddp
nmap <Up> dd2kp
vmap <Right> >
vmap <Left> <

noremap <Leader>w :w <cr>
noremap <Leader>q :qa<cr>

" Make tab characters appear 4 spaces wide
set tabstop=4
set softtabstop=0 expandtab
set shiftwidth=4

" switch.vim
let g:switch_mapping = "-"
let g:switch_custom_definitions =
    \ [
    \   ['lat', 'lon', 'alt'],
    \   ['x', 'y', 'z'],
    \   ['True', 'False'],
    \   ['or', 'and']
    \ ]

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

let g:indentLine_setColors = 0
let g:indentLine_char = '▏'

set number			" Line numbers
set numberwidth=3

" YCM configuration
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

" godlygeek/tabular
nnoremap <Leader>= :Tabularize /=<CR>
vnoremap <Leader>= :Tabularize /=<CR>
nnoremap <Leader>: :Tabularize /:\zs<CR>
vnoremap <Leader>: :Tabularize /:\zs<CR>
nnoremap <Leader>, :Tabularize /,\zs<CR>
vnoremap <Leader>, :Tabularize /,\zs<CR>

" nathanielc/vim-tickscript
let g:tick_fmt_autosave = 0

" Copy and pastes
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" {{{ Fix bracketed paste problem
" workaround for https://github.com/vim/vim/issues/1start671
if has("unix")
  let s:uname = system("echo -n \"$(uname)\"")
  if !v:shell_error && s:uname == "Linux"
    set t_BE=
  endif
endif
" }}}

" Enable mouse support
"set mouse=a
