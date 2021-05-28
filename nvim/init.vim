" Source plugins
source $DOTFILES/nvim/plug.vim

" Source keymaps
source $DOTFILES/nvim/map.vim

" Terminal.app doesn't support true colors
if $TERM_PROGRAM != 'Apple_Terminal'
"  set termguicolors
endif
set relativenumber
set list
set encoding=UTF-8
set lcs=eol:¬,space:·,tab:»\ ,trail:·
set updatetime=50
set clipboard=unnamed
set rtp+=$HOMEBREW_HOME . '/opt/fzf'

" Theme setup
let g:dracula_italic = 0
colorscheme nord
highlight Normal ctermbg=None

let g:ctrlp_dont_split = 'nerdtree'
let g:python3_host_prog = '/usr/local/bin/python3'
let g:gitgutter_realtime = 1

" Ruby
set tags+=.git/tags
autocmd FileType ruby setlocal tags=.git/rubytags

autocmd filetype crontab setlocal nobackup nowritebackup
