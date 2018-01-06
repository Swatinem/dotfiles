" Plugins
call plug#begin()

"Plug 'ayu-theme/ayu-vim'
"Plug 'bling/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'

Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'itchyny/lightline.vim'

Plug 'editorconfig/editorconfig-vim'

Plug 'rust-lang/rust.vim', { 'for': 'rust' }

Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'flowtype/vim-flow', { 'for': ['javascript', 'javascript.jsx'] }

Plug 'w0rp/ale'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
"Plug 'junegunn/fzf' " pacman has this as global vim plugin
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/neosnippet.vim'

call plug#end()

set rtp+=/usr/share/vim/vimfiles

" Options

" generic settings
set ruler
set number
set scrolloff=5
set textwidth=100
let &colorcolumn="80,".join(range(120,500),",")

set nobackup nowritebackup noswapfile
set ignorecase smartcase
set clipboard=unnamed,unnamedplus
set mouse=a
set nomousehide
set noshowmode
set cursorline
set laststatus=2

set hidden splitbelow splitright

set lazyredraw ttyfast

" tabs and indent settings
set tabstop=4 shiftwidth=4 softtabstop=4
set smarttab expandtab autoindent copyindent preserveindent

" display whitespace
set list
set listchars=tab:→ ,eol:↲,conceal:·,trail:·

" Wrapping
set wrap linebreak
set whichwrap+=<,>,h,l,[,]
noremap  <silent> <Up>   gk
noremap  <silent> <Down> gj
noremap  <silent> <Home> g<Home>
noremap  <silent> <End>  g<End>
inoremap <silent> <Up>   <C-o>gk
inoremap <silent> <Down> <C-o>gj
inoremap <silent> <Home> <C-o>g<Home>
inoremap <silent> <End>  <C-o>g<End>

" Theme
set t_Co=256
set termguicolors
colorscheme onehalflight

"let ayucolor="mirage"
"let g:airline_theme="wombat"
"colorscheme ayu

" Keybindings
let mapleader = ","
map <Space> <Leader>

" disable stupid F1 help
map <F1> <nop>
imap <F1> <nop>

" ctrl+s = save
inoremap <silent> <C-s> <C-o>:w<cr>
nnoremap <silent> <C-s> :w<cr>
nnoremap <silent> <leader>w :w<cr>
nnoremap <silent> <leader>s :w<cr>

" ctrl+w = close current buffer in window
nnoremap <C-w> :bnext<bar>split<bar>bprevious<bar>bdelete<CR>

" cycle through buffers with ctrl (+shift) + tab [does not work in the terminal :-(]
"nnoremap <C-Tab> :bnext<CR>
"nnoremap <C-S-Tab> :bprevious<CR>
nnoremap <C-right> :bnext<CR>
nnoremap <C-left> :bprevious<CR>

" insert newline
nnoremap <Enter> o<Esc>

" move between windows with alt + arrows
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

tnoremap <silent> <A-Up> <C-\><C-n> :wincmd k<CR>
tnoremap <silent> <A-Down> <C-\><C-n> :wincmd j<CR>
tnoremap <silent> <A-Left> <C-\><C-n> :wincmd h<CR>
tnoremap <silent> <A-Right> <C-\><C-n> :wincmd l<CR>

" Plugin Options
let NERDCommentWholeLinesInVMode=1

" NERDTreee Options
let g:NERDTreeShowHidden=1
let g:NERDTreeShowBookmarks=1
let g:NERDTreeChDirMode=2
let g:NERDTreeMouseMode=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeWinSize=25
nmap <C-t> :NERDTreeToggle<CR>

" open files
nnoremap <Leader>o :FZF<CR>

" Completion and snippet options
let g:LanguageClient_rootMarkers = {
    \ 'javascript': ['.flowconfig'],
    \ 'javascript.jsx': ['.flowconfig'],
    \ 'rust': ['Cargo.toml'],
\ }
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['flow-language-server', '--stdio'],
    \ 'javascript.jsx': ['flow-language-server', '--stdio'],
\ }
let g:LanguageClient_autoStart = 1

let g:flow#enable = 0
let g:flow#autoclose = 1
let g:flow#showquickfix = 0
"let g:flow#omnifunc = 0
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

let g:echodoc#enable_at_startup = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_menu_width = 0
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['buffer']
" TODO: create some custom snippets
let g:neosnippet#disable_runtime_snippets = {
    \   '_' : 1,
\ }

imap <expr><Tab> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ? "\<C-n>" : "\<Tab>")
smap <expr><Tab> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<Tab>"
imap <expr><S-Tab> pumvisible() ? "\<C-p>" : ""
smap <expr><S-Tab> pumvisible() ? "\<C-p>" : ""
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" lightline Options
let g:lightline = {
    \ 'colorscheme': 'onehalfdark',
    \ 'active': {
    \    'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename' ] ],
    \    'right': [ [ 'lineinfo' ], [ 'filetype' ] ],
    \ },
    \ 'component_function': {
    \    'filename': 'LightlineFilename',
    \ },
\ }

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

" smart home
function! SmartHome(mode)
  let curcol = col(".")
  "gravitate towards beginning for wrapped lines
  if curcol > indent(".") + 2
    call cursor(0, curcol - 1)
  endif
  if curcol == 1 || curcol > indent(".") + 1
    if &wrap
      normal g^
    else
      normal ^
    endif
  else
    if &wrap
      normal g0
    else
      normal 0
    endif
  endif
  if a:mode == "v"
    normal msgv`s
  endif
  return ""
endfunction

nmap <silent> <Home> :call SmartHome("n")<CR>
imap <silent> <Home> <C-r>=SmartHome("i")<CR>
vmap <silent> <Home> <Esc>:call SmartHome("v")<CR>
