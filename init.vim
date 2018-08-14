set nocompatible

" Vundle setup
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')
Plugin 'VundleVim/Vundle.vim'
" Add plugins here
Plugin 'neomake/neomake'
Plugin 'tpope/vim-commentary'
Plugin 'airblade/vim-gitgutter'
Plugin 'junegunn/fzf'
Plugin 'joshdick/onedark.vim'
Plugin 'ervandew/supertab'
Plugin 'vim-airline/vim-airline'
Plugin 'lervag/vimtex'
Plugin 'donRaphaco/neotex'
call vundle#end()

filetype plugin indent on
let g:tex_flavor='latex'

" General Vim
set updatetime=100
set nobackup
set noswapfile

" Colors and fonts
	" Highlight spaces at end of line / before tabs
autocmd ColorScheme * highlight ExtraWhitespace
	\ ctermbg=green guibg=darkgreen
autocmd InsertLeave * match ExtraWhitespace /\s\+$\| \+\ze\t/
autocmd InsertEnter * match

	" Set colorscheme and syntex
colorscheme onedark
set background=dark
syntax enable
set termguicolors

" ui config
set	mouse=a
set number relativenumber
set lazyredraw

" Tab complete
set wildmode=longest,list,full
set wildmenu
set wildignore=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*.DS_Store

" Show invisibles
set list
set listchars=tab:▸\ ,eol:¬

" Searching and autocomplete
set ignorecase
set smartcase
set showmatch
set incsearch
set hlsearch

" Tabs and spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set cc=80
set backspace=indent,eol,start
"
" Comment wrapping
set textwidth=75
set formatoptions=cqr

" Leader shortcuts
nnoremap <space> <Nop>
let mapleader =" "

	"Save and quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>Q :qa<CR>
"
	"Don't enter ex mode
noremap Q <nop>

	" Tabs
nnoremap <leader>t :tab drop
nnoremap <leader>H :tab help
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt

	"Splits
nnoremap <leader>s :vsplit
nnoremap <leader>n <C-w><C-w>
nnoremap <leader>p <C-w><C-p>
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

	"Jumps
nnoremap <leader>o <C-o>

	"Commentj
map <leader>cl gcc
map <leader>cp gcap

	" Search and replace all in line or visual selection.
noremap <leader>r :s//g<left><left>
noremap <leader>R :%s//g<left><left>

	" Change surrounding parenthesis/brackets.
nnoremap <leader>( mt%r)`tr(
nnoremap <leader>{ mt%r}`tr{
nnoremap <leader>[ mt%r]`tr[

nnoremap <leader>) mt%r(`tr)
nnoremap <leader>} mt%r{`tr}
nnoremap <leader>] mt%r[`tr]

" Remap
nnoremap ; :
nnoremap Y y$
nnoremap B ^
nnoremap E $
nnoremap ^ <nop>
nnoremap $ <nop>
nnoremap j gj
nnoremap k gk

" Auto close
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap (<CR> (<CR>)<ESC>O
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Plugin Options
	" Airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline#extensions#tabline#tab_nr_type=1
let airline#extensions#tabline#show_splits=0

	" SuperTab
let g:SuperTabDefaultCompletionType="context"
let g:SuperTabCompletionContexts=['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextTextOmniPrecedence=['&completefunc', '&omnifunc']
let g:SuperTabContextDiscoverDiscovery=
            \ ["&completefunc:<c-p>", "&omnifunc:<c-x><c-o>"]

" Template for new matlab files. Try to move to matlab.vim. By the
" filetype is checked BufNewFile can't be called
autocmd BufNewFile *.m call InsertFunction()
function InsertFunction()
	let filename = expand("%:t:r")
	exe "normal!ggifunction ".filename
	normal!A()
	normal!oend
	normal!gg
endfunction
