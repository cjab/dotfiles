set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle "gmarik/vundle"

Bundle "wincent/Command-T"
Bundle "vim-scripts/CSApprox"
Bundle "vim-scripts/hexman.vim"
Bundle "othree/html5.vim"
Bundle "JuliaLang/julia-vim"
Bundle "juvenn/mustache.vim"
Bundle "scrooloose/nerdtree"
Bundle "thiderman/nginx-vim-syntax"
Bundle "shawncplus/php.vim"
Bundle "scrooloose/syntastic"
Bundle "kchmck/vim-coffee-script"
Bundle "hail2u/vim-css3-syntax"
Bundle "tpope/vim-cucumber"
Bundle "tpope/vim-fugitive"
Bundle "tpope/vim-haml"
Bundle "pangloss/vim-javascript"
Bundle "maksimr/vim-jsbeautify"
Bundle "tpope/vim-markdown"
Bundle "b4winckler/vim-objc"
Bundle "tpope/vim-rails"
Bundle "jpalardy/vim-slime"
Bundle "dterei/Twilight"


let g:syntastic_enable_signs=1
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
let g:slime_target="tmux"

let mapleader = ','

color twilight

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

set list
set listchars=tab:▸\ ,trail:▪
highlight NonText guifg=#4a4a59
highlight NonText guibg=#1a1a1a
highlight SpecialKey guifg=#2c2c35
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

map <C-n> :tabn<CR>
map <C-p> :tabp<CR>
map <C-t> :tabnew<CR>
map <leader>n :NERDTreeToggle \| :silent NERDTreeMirror<CR>
map <leader>v :tabedit $MYVIMRC<CR>
map <leader>s :setlocal spell spelllang=en_us<CR>
map <leader>b :Gblame
map <leader>y :CommandTFlush<CR>
map <leader>w :%s/\s\+$//e<CR>
set pastetoggle=<leader>p

autocmd FileType python
  \ setlocal expandtab |
  \ setlocal shiftwidth=4 |
  \ setlocal tabstop=4

au! BufNewFile,BufRead *.m setf objc

if has("unix")
  let s:uname = system("uname")

  if s:uname == "Darwin"
    let g:clang_use_library=1
    let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
    let g:clang_periodic_quickfix=1
    let g:clang_debug=1

    function! XCodeBuild()
      let l:command = 'xcodebuild -sdk iphonesimulator5.0'
      let l:out     = system(l:command)
      cexpr l:out
    endfunction
  endif

  if s:uname == "Linux"
    set clipboard=unnamed
  endif
endif
