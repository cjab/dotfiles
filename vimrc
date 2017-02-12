call plug#begin('~/.vim/plugged')

Plug 'vim-polyglot'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'vim-scripts/CSApprox'
Plug 'neomake/neomake'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }
Plug 'ivalkeen/vim-simpledb', { 'for': 'sql' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'jgdavey/tslime.vim'
Plug 'dterei/Twilight'

call plug#end()


color twilight

let mapleader = ','
nmap c ,

let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'

autocmd! BufWritePost,BufEnter * Neomake
let g:neomake_javascript_enabled_makers = ['eslint', 'flow']
let g:neomake_ruby_enabled_makers = ['rubocop', 'mri']
let g:neomake_ocaml_enabled_checkers = ['merlin']
let g:neomake_error_sign = {
  \ 'text': '❌',
  \ }
let g:neomake_warning_sign = {
  \ 'text': '💥',
  \ }

syn on filetype plugin on
filetype plugin indent on

set ai
set si
set expandtab
set tabstop=2
set shiftwidth=2
set nowrap
set visualbell t_vb=
set laststatus=2
set ruler

set list
set listchars=tab:▸\ ,trail:▪
highlight NonText guifg=#4a4a59
highlight NonText guibg=#1a1a1a
highlight SpecialKey guifg=#2c2c35
highlight ColorColumn guibg=#262626
set clipboard=unnamed

hi LineNr ctermbg=black ctermfg=blue guibg=gray20 guifg=DarkSeaGreen4
hi CursorLineNr ctermfg=Yellow guifg=SeaGreen1
set number
set nocursorline

map <C-n> :tabn<CR>
map <C-p> :tabp<CR>
map <C-t> :tabnew<CR>
map <leader>n :NERDTreeToggle \| :silent NERDTreeMirror<CR>
map <leader>v :tabedit $MYVIMRC<CR>
map <leader>s :setlocal spell spelllang=en_us<CR>
map <leader>b :Gblame
map <leader>t :FZF<CR>
map <leader>w :%s/\s\+$//e<CR>
map <leader>a :AT<CR>
map <Leader>r :call RunNearestSpec()<CR>
map <Leader>e :call RunCurrentSpecFile()<CR>
map <Leader>g :MerlinTypeOf<CR>
set pastetoggle=<leader>p

let $FZF_DEFAULT_COMMAND = 'ag -g ""'
