" Poner los colores en 256
set t_Co=256

" Quitar toda la mierda que trae Gvim
set go-=T
set go-=m
highlight SpellBad term=underline gui=undercurl guisp=orange

" Establecer el encoding bajo el estandar UTF-8
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" Opciones básicas 
set mouse=a
syntax enable
set nu
set numberwidth=1
set nocompatible "Be IMproved
set autoindent
set smartindent
set tabstop=4 " Las tabulaciones serán de 4 espacios
set shiftwidth=4 "Los indents serán de 4 espacios
set backspace=indent,eol,start
set laststatus=2
set history=1000
set undoreload=10000
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set showbreak=↪
set autowrite
set autoread
set title
set linebreak
set colorcolumn=+1

" Soft-wrap a las líneas de mas de 140 caracteres, 80 es para putos
set textwidth=141

" Guardar cuando se pieda el foco en la ventana
au FocusLost = :wa

" Mantener el tamaño del buffer cuando la ventana sea modificada
au VimResized * exe "normal! \<c-w>="  

" Condicional para el superusuario
if $USER == "root"
	set nomodeline
	set noswapfile
else
	set modeline
	set swapfile
endif


"Temas (Requiere que se encuentren en el folder ~/.vim)
colorscheme space-vim-dark
set background=dark

" Poner las líneas de indent para marcar donde comienza. termina un archivo
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

"Configuraciones de Airline (Requiere el paquete vim-airline instalado)
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='violet'

"Soporte para lenguajes culeros
let g:javascript_plugin_flow = 1

"Configuración para cambiar la forma del cursor en diferentes modos de vim

if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[5 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[3 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif" ]]]]

" Opciones para jshint

" Lint JS files after reading
let jshint2_read = 1

" Lint JS files after saving

let jshint2_save = 1

" Iniciar NERDTree (Navegador de archivos)

autocmd StdinReadPre * let s:srd_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Abrir NERDTree cuando vim se inicie en un directorio

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Cerrar vim si solo queda NERDTree abierto
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Encender la tagbar con f8
nmap <F8> :TagbarToggle<CR>

" ctags para MAKEFILE

let g:tagbar_type_make = {
	\ 'kinds' :[
		\ 'm:macros',
		\ 't:targets'
	\]
\}

" ctags para Markdown

let g:tagbar_type_markdown = {
		\ 'ctagstype' : 'markdown',
		\ 'kinds' : [
			\ 'h:Heading_L1',
			\ 'i:Heading_L2',
			\ 'k:Heading_L3'
		\]
	\}

" Resaltado de sintaxis para C++ y que se vea menos culero
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1

"Evitar que vim haga su cagadero con las llaves
let c_no_curly_error=1

