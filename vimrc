set nocompatible	"Be Improved

call plug#begin(expand('~/.vim/plugged'))
"" Paquetes todos pendejos de plug
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/CSApprox'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'
Plug 'Shougo/vimproc.vim', {'do': 'make'}

" Linters
Plug 'w0rp/ale'

"Plugins para C/C++
Plug 'octol/vim-cpp-enhanced-highlight'

"Selector de colores
Plug 'KabbAmine/vCoolor.vim'

"Vim A.L.E
    "Enable A.L.E
let g:ale_completion_enabled = 1
let g:ale_sign_error = "✗"
let g:ale_sign_warning = "⚠"

" ------RUST-----

"Rust binaries path
let PATH="$HOME/.cargo/bin:$PATH"
let RUST_SRC_PATH="~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src:$RUST_SRC_PATH"
" Rust
" Rust.vim
Plug 'rust-lang/rust.vim'

" rust

autocmd FileType *.rs setlocal tabstop=4 expandtab shiftwidth=4 smarttab
autocmd BufReadPost *.rs setlocal filetype=rust

au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

"Rust-vim Options
let g:rustc_path = '/home/omar/.cargo/bin/rustc'
let g:rust_recommended_style = 1
let g:rust_fold = 2

"A.L.E Rust Settings
"Various settings for Rust
let g:ale_linters = {
            \ 'rust': [ 'rls' ],
            \ }
let g:ale_rust_rls_executable = '/home/omar/.cargo/bin/rls'
let g:ale_rust_rls_toolchain = 'nightly'

" -----END OF RUST----------

" Paréntesis bonitos
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

" Vim Markdown Composer
function! BuildComposer(info)
    if a:info.status != 'unchanged' || a:info.force
        if has('nvim')
            !cargo build --release
        else
            !cargo build --release --no-default-features --features json-rpc
        endif
    endif
endfunction

Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

"YouCompleteMe
Plug 'Valloric/YouCompleteMe'

" Vim proc
Plug 'Shougo/vimproc.vim'


if v:version >= 704
  "" Snippets
  Plug 'SirVer/ultisnips'
endif

Plug 'honza/vim-snippets'

""Colores para que se vea bien chingón vim
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'liuchengxu/space-vim-dark'
Plug 'srcery-colors/srcery-vim'
""Lenguajes culeros

" c
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
Plug 'ludwig/split-manpage.vim'


" html
"" HTML Bundle
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-haml'

" javascript
"" Javascript Bundle
Plug 'jelera/vim-javascript-syntax'

call plug#end()

filetype plugin indent on

" Encodings

set encoding=UTF-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary

set ttyfast

" Arreglar el indent de backspace
set backspace=indent,eol,start

" Tabulaciones bonitas
set tabstop=4
set shiftwidth=4
set expandtab

" Quitar las barras culeras de gvim
set guioptions -=m
set guioptions -=T

"" Map leader to
let mapleader=','

"Buffers ocultos
set hidden

""Motor de búsqueda
set hlsearch
set incsearch
set ignorecase
set smartcase

""Evitar los cagaderos de vim
set nobackup
set noswapfile

set fileformats=unix,dos,mac

"" cosas pa doblar el código y no ver todo
set foldmethod=indent
set nofoldenable
"***************************************************
"Opciones visuales para que vim no se vea culero
"***************************************************
syntax on
set number
set numberwidth=1
set mouse=a
set mousemodel=popup
set t_Co=256
let g:CSApprox_loaded = 1
set colorcolumn=80

" El tema que wausar c:
set background=dark
colorscheme srcery
hi Comment cterm=italic
let g:space_vim_dark_background = 233
let g:rehash256 = 1
" indicadores de indent por si tengo que programar en la caca de python
let g:indentLine_enabled = 1
let g:indentLine_char = '·'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_first_char = '·'
"" barrita de abajo toda chingona
set laststatus=2

"" Noc que hace esto
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

"" Mapeado de búsqueda (no preguntar que hace)
nnoremap n nzzzv
nnoremap N Nzzzv

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" vim-airline
let g:airline_theme = 'ouo'

let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

"*****************************************************************************
"" Abreviaciones chidas para no cagarla con los comandos
"*****************************************************************************
"" neta, te hacen un parote con el bloq mayus puesto
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"" Config del arbolito que sale con <F3>
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 20
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>

" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'


"*****************************************************************************
"" Funciones chingonas para que se formatien bien chido los archivos
"*****************************************************************************
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=80
  endfunction
endif


"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END


"*****************************************************************************
"" Mappeado de teclas because yes
"*****************************************************************************

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" Mapeado de sesiones
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

"" tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" directorio de trabajo
nnoremap <leader>. :lcd %:p:h<CR>

"" Abrir donde se quedó alv
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" no me acuerdo que hace esto
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="/.config/nvim/ultisnips/UltiSnips"

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" Quitar la visualbell para que no me sangren los ojos
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" Intento de arreglar los cagaderos en gvim
set noeb vb t_vb=

"" Copy/Paste/Cut porque todos quieren clipboard aquí
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>


"" navegar en el buffer
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

"" cerrar buffer alv
noremap <leader>c :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Cambiar de ventanas
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Cositas para las flechitas
vmap < <gv
vmap > >gv

"" Unos bloquesotes bien sexys
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"*****************************************************************************
"" Configuraciones especiales para lenguajes culeros
"*****************************************************************************

" c
autocmd FileType c setlocal tabstop=8 shiftwidth=8 expandtab
autocmd FileType cpp setlocal tabstop=8 shiftwidth=8 expandtab

" Kiasko Python
autocmd FileType py setlocal tabstop=4 shiftwidth=4 expandtab

" html
" for html files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab


" javascript
let g:javascript_enable_domhtmlcss = 1

" vim-javascript
augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2
augroup END


" vim-airline
let g:airline#extensions#virtualenv#enabled = 1


"*****************************************************************************
"" Variables para que vim juncie bien perrón
"*****************************************************************************

" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

