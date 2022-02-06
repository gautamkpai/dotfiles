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
Plug 'elixir-editors/vim-elixir'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-vinegar'

" On-demand loading
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }

" colorschemes
Plug  'nanotech/jellybeans.vim'
Plug 'jpo/vim-railscasts-theme'
Plug  'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'rakr/vim-one'
Plug 'ackyshake/spacegray.vim', { 'branch': 'main' }
Plug 'arzg/vim-colors-xcode'
Plug 'severij/vadelma'
Plug 'cormacrelf/vim-colors-github'

" Disabled plugins
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
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

" Line-wise scrolling is painfully slow for ruby files when using cursorline
" For on-demand cursorline toggling use `yoc`
autocmd Filetype ruby setlocal nocursorline

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

colorscheme railscasts

" colorscheme one               "Need to set bg dark after this line
" set background=dark           "Explicitly tell vim that the bg is dark

" let g:gruvbox_contrast_dark = 'hard'  "Options: hard, medium or soft
" let g:gruvbox_improved_strings = '1'
" let g:gruvbox_italic = '1'
" colorscheme gruvbox

" let ayucolor='dark'           "Options: light, mirage or dark
" colorscheme ayu

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

nmap <Tab> <C-w><C-w>
nnoremap <Space><Space> :noh<CR>

set laststatus=2                "Show the status line all the time
set showcmd                     "Display incomplete commands.

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

" Add file preview option to fzf fuzzy file search
" nnoremap .. :FZF<CR>
let g:fzf_files_options =
    \ '--preview "highlight -O truecolor -s base16/railscasts --force {} 2> /dev/null"'
nnoremap .. :Files!<CR>

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

" Use ripgrep for search.
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg  --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({ 'options': '--reverse' })
  \           : fzf#vim#with_preview('up:50%:hidden', '?'),
  \   <bang>0)
nnoremap \ :Rg!<SPACE>

nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
