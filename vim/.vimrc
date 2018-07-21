call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'rlgomes/vim-simpledb', { 'for': 'sql' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'morhetz/gruvbox'
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'styled-components/vim-styled-components', { 'branch': 'rewrite', 'for': 'javascript' }
Plug 'jparise/vim-graphql', { 'for': 'javascript' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
"Plug 'dterei/Twilight'
"Plug 'vim-polyglot'
"Plug 'vim-scripts/CSApprox'
"Plug 'neomake/neomake'
"Plug 'hail2u/vim-css3-syntax'
"Plug 'rizzatti/dash.vim'
"Plug 'jgdavey/tslime.vim'
"Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }

call plug#end()


"color twilight
color gruvbox
set background=dark

let mapleader = ','
nmap c ,

let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'

" Ale
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '•'
let g:ale_fix_on_save = 1
let g:ale_fixers = {}
let g:ale_fixers['ruby'] = []
let g:ale_fixers['rust'] = ['rustfmt']
let g:ale_lint_delay = 1000
let g:ale_javascript_flow_executable = 'npm run typecheck'

hi ALEErrorSign ctermfg=9 ctermbg=235
hi ALEWarningSign ctermfg=11 ctermbg=235

"" NeoMake
"autocmd! BufWritePost,BufEnter * Neomake
"let g:neomake_elixir_enabled_makers = []
"let g:neomake_javascript_enabled_makers = ['eslint', 'flow']
"let g:neomake_javascript_flow_exe = $PWD .'/node_modules/.bin/flow'
"let g:jsx_ext_required = 0
"let g:neomake_ruby_enabled_makers = ['rubocop', 'mri', 'rufo']

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
hi NonText guifg=#4a4a59
hi NonText guibg=#1a1a1a
hi SpecialKey guifg=#2c2c35
hi ColorColumn guibg=#262626
set clipboard=unnamed

hi LineNr ctermbg=black ctermfg=blue guibg=gray20 guifg=DarkSeaGreen4
hi CursorLineNr ctermfg=Yellow guifg=SeaGreen1
set number
set nocursorline

hi SignColumn ctermbg=black ctermfg=black guibg=gray20 guifg=DarkSeaGreen4
set scl=yes

map <C-n> :tabn<CR>
map <C-p> :tabp<CR>
map <C-t> :tabnew<CR>
map <leader>n :NERDTreeToggle \| :silent NERDTreeMirror<CR>
map <leader>v :tabedit $MYVIMRC<CR>
map <leader>s :setlocal spell spelllang=en_us<CR>
map <leader>b :Gblame
map <leader>t :FZF<CR>
map <leader>d :Dash<CR>
map <leader>w :%s/\s\+$//e<CR>
map <leader>a :AT<CR>
map <Leader>r :call RunNearestSpec()<CR>
map <Leader>e :call RunCurrentSpecFile()<CR>
map <Leader>g :MerlinTypeOf<CR>
set pastetoggle=<leader>p

let $FZF_DEFAULT_COMMAND = 'rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'

func! WordProcessorMode()
    setlocal formatoptions=t1
    setlocal textwidth=80
    map j gj
    map k gk
    setlocal smartindent
    setlocal spell spelllang=en_us
    setlocal noexpandtab
endfu
com! WP call WordProcessorMode()

" Rust
" let g:rustfmt_autosave = 1

" Ruby
set re=1

highlight clear ALEWarningSign
highlight clear ALEErrorSign
