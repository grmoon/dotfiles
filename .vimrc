set nocompatible
set backspace=indent,eol,start
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set hlsearch

" Add vundle to the runtimepath
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf

" open new vsplits on the right, not the left
set splitright

" open new splits on the bottom, not the top
set splitbelow

" Show absolute number on current line and relative numbrs on the others
" https://jeffkreeftmeijer.com/vim-number/
set number relativenumber

syntax on
filetype plugin indent on


call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'posva/vim-vue'
Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'junegunn/fzf.vim'

Bundle 'farseer90718/vim-taskwarrior'
call vundle#end()

" Vue syntax highligting
autocmd BufNewFile,BufRead *.vue set ft=vue

" babelrc syntax highlighting
autocmd BufNewFile,BufRead .babelrc set ft=json

" linting
let g:syntastic_always_populate_loc_list = 1 
let g:syntastic_auto_loc_list = 1
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1

let NERDTreeIgnore = ['\.pyc$']

" lint on write
let g:syntastic_check_on_w = 1
let g:syntastic_javascript_checkers = ['jshint']
"let g:syntastic_javascript_eslint_exe = 'jshint'

" Red bar at 120 characters
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%121v.\+/

" Open NerdTree using ctrl-n
map <C-n> :NERDTreeToggle<CR>
map <C-p> :Files<CR>

" Close vim if NERDTree is the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
