call plug#begin('~/.vim/plugins')

Plug 'junegunn/vim-easy-align'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()


vmap <C-S-c> "+y
vmap <C-S-v> "+p
syntax on
filetype indent on

" For indents that consist of 4 space characters but are entered with the tab key:
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

set number "Display lines's id
set wildmenu "Autocompletion in vim command line
set incsearch "To start highlighting as soon as you start typing for search
"set hlsearch "Highlights everything till the end of the session. Type :noh to
"clean
set mouse=a

