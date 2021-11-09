vmap <C-S-c> "+y
vmap <C-S-v> "+p
syntax on
filetype indent on

set tabstop=4
set number "Display lines's id
set wildmenu "Autocompletion in vim command line
set incsearch "To start highlighting as soon as you start typing for search
"set hlsearch "Highlights everything till the end of the session. Type :noh to clean

"The long line will be visually wrapped. “j” will no longer skip the fake part of the visual line.
nnoremap j gj
nnoremap k gk

"Cool colorschemes: elflord ron torte murphy koehler slate
"Their path /usr/share/vim/vim82/colors/
colorscheme elflord

