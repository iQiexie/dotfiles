call plug#begin('~/.vim/plugins')

Plug 'junegunn/vim-easy-align'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
"Plug 'Rip-Rip/clang_complete'

call plug#end()

vmap <C-S-c> "+y
vmap <C-S-v> "+p
syntax on
filetype indent on

set tabstop=4
set number "Display lines's id
set wildmenu "Autocompletion in vim command line
set incsearch "To start highlighting as soon as you start typing for search
"set hlsearch "Highlights everything till the end of the session. Type :noh to clean
set viminfo+=n~/.vim/viminfo " Move .viminfo file to .vim folder


" MY KEYBINDINGS

vmap <C-y> "+y

"The long line will be visually wrapped. “j” will no longer skip the fake part of the visual line.
nnoremap j gj
nnoremap k gk

"Alt + j - move line down, alt + k - move line above"
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

"Cool colorschemes: elflord ron torte murphy koehler slate
"Their path /usr/share/vim/vim82/colors/
colorscheme elflord

set clipboard=unnamedplus


" vim-easy-allign
nmap ga <Plug>(EasyAlign)

set mouse=a
