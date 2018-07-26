" Source plugins
source $DOTFILES/nvim/plug.vim

" Source keymaps
source $DOTFILES/nvim/map.vim

set termguicolors
set relativenumber
set list
set encoding=UTF-8
set lcs=eol:¬,space:·,tab:»\ ,trail:·
set updatetime=50

" Theme setup
let ayucolor="mirage"
colorscheme ayu

let g:ctrlp_dont_split = 'nerdtree'
let g:python3_host_prog = '/usr/local/bin/python3'
let g:gitgutter_realtime = 1
