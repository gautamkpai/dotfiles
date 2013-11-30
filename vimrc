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

" colorschemes
Bundle  "nanotech/jellybeans.vim"

" filetype plugin indent on     " required!
filetype on                     "Enable filetype detection
filetype indent on              "Enable filetype-specific indenting
filetype plugin on              "Enable filetype-specific plugins

set number                      "Display line numbers

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab                   "Replace tabs with spaces

set t_Co=256                    "Enable 256 colors

colorscheme jellybeans

set cursorline                  "Highlight current line
set hidden                      "Reuse Window for multiple buffers

set smartindent
set autoindent

set ignorecase                  "Case-insensitive searching.
set smartcase                   "But case-sensitive if expression contains a capital letter.

syntax enable                   "Turn on syntax highlighting.

runtime macros/matchit.vim      " Load the matchit plugin.

set backupdir=/tmp//            "Centralized backup dir
set directory=/tmp//            "Centralized location for swap files

if has('gui_running')
  set guioptions-=T             "Remove toolbar
  set guioptions-=r             "Remove right-hand scroll bar
endif

"au GUIEnter * set lines=100 columns=120

"Bubble single line
nmap <C-Up> [e
nmap <C-Down> ]e

"Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

set laststatus=2                "Show the status line all the time
set showcmd                     "Display incomplete commands.
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Highlight trailing spaces.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
" match                         "Disable above highlighting

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
