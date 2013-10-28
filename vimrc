call pathogen#infect()
call pathogen#helptags()

set nocompatible                "Run in vim mode not vi

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

filetype on                     "Enable filetype detection
filetype indent on              "Enable filetype-specific indenting
filetype plugin on              "Enable filetype-specific plugins

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