set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle     " required!
Bundle 'gmarik/vundle'

" Bundles
Bundle "tpope/vim-fugitive"
Bundle "tpope/vim-bundler"
Bundle "tpope/vim-rake"
Bundle "tpope/vim-rbenv"
Bundle "vim-ruby/vim-ruby"
Bundle "kien/ctrlp.vim"
Bundle "tpope/vim-rails"
Bundle "tpope/vim-unimpaired"
Bundle "tpope/vim-surround"
Bundle "tomtom/tcomment_vim"
Bundle "thoughtbot/vim-rspec"
Bundle "kana/vim-textobj-user"
Bundle "nelstrom/vim-textobj-rubyblock"
Bundle "kchmck/vim-coffee-script"
Bundle "godlygeek/tabular"
Bundle "rking/ag.vim"
Bundle "ngmy/vim-rubocop"
Bundle "scrooloose/nerdtree"
Bundle "pearofducks/ansible-vim"

" vim-plug plugin manager
call plug#begin('~/.vim/plugged')

" colorschemes
Plug  'nanotech/jellybeans.vim'

" Add plugins to &runtimepath
call plug#end()

" filetype plugin indent on     " required!
filetype on                     "Enable filetype detection
filetype indent on              "Enable filetype-specific indenting
filetype plugin on              "Enable filetype-specific plugins
autocmd FileType yaml setl indentkeys-=<:>

set number                      "Display line numbers
set history=50                  "More than the default 20

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab                   "Replace tabs with spaces

set backspace=indent,eol,start  "Backspace over everything

set wildmode=longest,list,full  "bash-like tab completion.
set wildmenu                    "first tab completes, second provides a list, third cycles through the options

set t_Co=256                    "Enable 256 colors

colorscheme jellybeans

set cursorline                  "Highlight current line
set hidden                      "Reuse Window for multiple buffers

set smartindent
set autoindent

set ignorecase                  "Case-insensitive searching.
set smartcase                   "But case-sensitive if expression contains a capital letter.
set incsearch                   "Search as you type
set hlsearch                    "Higlight search matches

syntax enable                   "Turn on syntax highlighting.

runtime macros/matchit.vim      " Load the matchit plugin.

set backupdir=/tmp//            "Centralized backup dir
set directory=/tmp//            "Centralized location for swap files

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

nmap <Tab> <C-w><C-w>
nnoremap <Space><Space> :noh<CR>

set laststatus=2                "Show the status line all the time
set showcmd                     "Display incomplete commands.
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

"Highlight Search
highlight Search ctermbg=208 ctermfg=Black cterm=NONE

" Highlight trailing spaces.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
" match                         "Disable above highlighting

autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
execute "set colorcolumn=" . join(range(121,335), ',')

let g:rspec_command = "!spring rspec {spec}"

" Rspec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

command! TagFiles :call EchoTags()
function! EchoTags()
  echo join(split(&tags, ","), "\n")
endfunction

" Disable arrow keys
" map <up> <nop>
" map <down> <nop>
