set nocompatible               " be iMproved
filetype off                   " required!

" vim-plug plugin manager
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'tpope/vim-fugitive'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'rking/ag.vim', { 'on': 'Ag' }

" colorschemes
Plug  'nanotech/jellybeans.vim'
Plug  'morhetz/gruvbox'

" Disabled plugins
" Plug 'godlygeek/tabular'
" Plug 'tpope/vim-bundler'
" Plug 'tpope/vim-rake'
" Plug 'tpope/vim-rbenv'
" Plug 'ngmy/vim-rubocop'
" Plug 'thoughtbot/vim-rspec'
" Plug 'pearofducks/ansible-vim'

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

set termguicolors               "Enable 24bit true colour support ("888" colours (aka 16 milion))

" colorscheme jellybeans

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_improved_strings = '1'
colorscheme gruvbox

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

" Quickly edit/reload the vimrc file
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :so $MYVIMRC<CR>

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

nnoremap .. :FZF<CR>

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader><Enter> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>
