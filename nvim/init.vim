" Source plugins
source $DOTFILES/nvim/plug.vim

" Source keymaps
source $DOTFILES/nvim/map.vim

set termguicolors
set relativenumber
set list
set lcs=eol:¬,space:·,tab:»\ ,trail:·

" Theme setup
let ayucolor="mirage"
colorscheme ayu

let g:ctrlp_dont_split = 'nerdtree'
