" =========================================================================
"                  misc
" =========================================================================
set nocompatible                     " not vi compatible
set path+=**                         " fzf files
set clipboard=unnamedplus            " registers to system clipboard
set mouse=a
set cursorline
set number relativenumber
set termguicolors
set history=10000
set foldmethod=syntax                " starts files in folds
set splitbelow splitright

syntax enable
filetype plugin on
language en_US.utf8
set encoding=utf-8

" =========================================================================
" timing
" =========================================================================
set updatetime=300
set timeoutlen=500 ttimeoutlen=50    " vim/sys timeout
" =========================================================================
" Cursor shape
" =========================================================================
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
" ========================================================================= 
" bakup
" ========================================================================= 
set nobackup nowritebackup noswapfile
" ========================================================================= 
" search
" ========================================================================= 
set hlsearch incsearch
set ignorecase smartcase
" ========================================================================= 
" netrw
" ========================================================================= 
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=0
let g:netrw_keepdir=0
let g:netrw_localcopydircmd = 'cp -r'
let g:netrw_winsize = 15
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
hi! link netrwMarkFile Search

function! NetrwMapping()
endfunction

augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
  nmap <buffer> h -^
  nmap <buffer> l <CR>

  nmap <buffer> . gh
  nmap <buffer> ? p
  nmap <buffer> ;/ <c-w>z
	nmap <buffer> L <CR>:Lexplore<CR>
	nmap <buffer> c R
	nmap <buffer> f d
	nmap <buffer> dd D
endfunction

" =========================================================================
" bottom part
" =========================================================================
set laststatus=2                     " allways show
set statusline=%=%f%m%=              " status line will show file name and if it's been modified (in the center)

" ========================================================================= 
" hidden characters
" ========================================================================= 
set listchars=tab:.\ 
set list

" ========================================================================= 
" indentation
" ========================================================================= 
set noexpandtab tabstop=2 shiftwidth=2
set autoindent smartindent cindent

" =========================================================================
" completion
" =========================================================================
set wildmenu                         " completion on command mode
set omnifunc=syntaxcomplete#Complete
set completeopt-=preview completeopt+=menuone,noselect
set shortmess+=c

" =========================================================================
" Plugins
" =========================================================================
call plug#begin()
Plug 'JeffVenancius/vim-rehab'       " avoid using arrow keys and such.
Plug 'habamax/vim-godot'
Plug 'tpope/vim-commentary'
Plug 'farmergreg/vim-lastplace'
Plug 'KabbAmine/yowish.vim'
call plug#end()

colorscheme yowish

" =========================================================================
" Mappings
" =========================================================================
let mapleader = " "

" page scroll with caret at center
nnoremap <silent><C-f> <C-f>zz
nnoremap <silent><C-b> <C-b>zz
nnoremap <silent><C-d> <C-d>zz
nnoremap <silent><C-u> <C-u>zz
nnoremap <silent>n nzz
nnoremap <silent>N Nzz

" Basic completion
inoremap <tab> <c-n>
inoremap <s-tab> <c-p>

" autopairs
inoremap ( ()<left>
inoremap [ []<left>
inoremap ' ''<left>
inoremap " ""<left>
inoremap { {}<left>


" Commentary
"
xnoremap <silent><leader>; <Plug>Commentary
nnoremap <silent><leader>; <Plug>Commentary
onoremap <silent><leader>; <Plug>Commentary
nnoremap <silent><leader>;; <Plug>CommentaryLine

" go up and down normally if the text is wrapped
nnoremap j gj
nnoremap k gk

" function calls
nnoremap <silent><leader>/ :Lex<cr>
nnoremap <leader><tab> :tabnew 
nnoremap <leader>\ :vsp 
nnoremap <leader>- :sp 

" =========================================================================
" automcmds
" =========================================================================
autocmd bufwritepre .vimrc :source
autocmd filetype c,cpp,javascript abbrev for for(int i = 0; i < __var__;i++<esc>?__var__<enter>ciw
autocmd filetype python,gdscript abbrev for for i in 
autocmd filetype python,gdscript abbrev if if:<left>
abbrev r;; return
abbrev p;; print
autocmd filetype javascript abbrev p;; console.out
autocmd filetype cpp abbrev p;; cout <<
autocmd filetype cpp abbrev ios;; #include <iostream>
autocmd filetype cpp abbrev inc;; #include
autocmd filetype python,javascript abbrev inc;; import
autocmd filetype html,xml inoremap < <__var__></__var__><esc>:s/__var__//g<left><left>
autocmd filetype vim iunmap "
