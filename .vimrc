set nocompatible

" plugins
filetype off
call plug#begin('~/.vim/plugged')
	Plug 'altercation/vim-colors-solarized'
	Plug 'tpope/vim-unimpaired'
	Plug 'kien/ctrlp.vim'
	Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
	" comments
	Plug 'scrooloose/nerdcommenter'
	" surround misc '...' "..." (...)
	Plug 'tpope/vim-surround'
	" align
	Plug 'pix/vim-align'
	Plug 'AutoAlign'
	" status
	Plug 'vim-airline/vim-airline'
	" Plug 'vim-airline/vim-airline-themes'
	" font size: map <Leader><Leader>
		" =    Begin "font size" mode
		" +    Increment font size (by [count])
		" -    Decrement font size (by [count])
		" 0    Revert to default font size
	Plug 'drmikehenry/vim-fontsize'
	" swift
	Plug 'keith/swift.vim', { 'for': 'swift' }
call plug#end()
filetype plugin indent on

" plugins setup
	" airline
	let g:airline_theme='dark'
	let g:airline_powerline_fonts=0
	let g:airline#extensions#tabline#enabled=1
	let g:airline#extensions#tabline#show_tabs = 1
	let g:airline#extensions#tabline#show_splits = 1
	" let g:airline#extensions#tabline#show_buffers = 1
	let g:airline#extensions#tabline#switch_buffers_and_tabs = 0
	silent doautocmd User AirlineToggledOn
	" comments
		let g:NERDSpaceDelims = 1
	" colors
		syntax enable
		let g:solarized_termcolors=256
		let g:solarized_termtrans=1
		set background=dark
		colorscheme solarized
	" font
		let g:fontsize#defaultSize = 13
		if has("gui_running")
			if has("gui_gtk2")
				" set guifont=Luxi\ Mono\ 13
				" set guifont=DejaVu\ Sans\ Mono:h13
			elseif has("x11")
				" Also for GTK 1
				" set guifont=*-lucidatypewriter-medium-r-normal-*-*-180-*-*-m-*-*
			elseif has("gui_win32")
				" set guifont=Luxi_Mono:h13:cANSI
			elseif has("gui_macvim")
				set guifont=Menlo\ Regular:h13
			endif
		endif
	" NERDTreeToggle
		let NERDTreeWinSize=44
		let NERDTreeMinimalUI=1
		let NERDTreeShowBookmarks=1
		let NERDTreeChDirMode=2
		let NERDTreeQuitOnOpen=1
		" let NERDTreeShowHidden=1
		let NERDTreeKeepTreeInNewTab=0
		let NERDTreeMinimalUI=1 " Disables display of the 'Bookmarks' label and 'Press ? for help' text.
		let NERDTreeDirArrows=1 " Tells the NERD tree to use arrows instead of + ~ chars when displaying directories.


" tab
set smartindent
set autoindent
set noexpandtab
set softtabstop=0
set shiftwidth=4
set tabstop=4
set shiftround

" search
set incsearch
set hlsearch
set ignorecase
set smartcase

" misc
	" Подсвечиваем 80 столбец
	if version >= 703 | set colorcolumn=80 | end
set wrap
set wrapmargin=8
set textwidth=0
set formatoptions-=o    " dont continue comments when pushing o/O
set linebreak           " Перенос не разрывая слов
set linespace=1         " add some line space for easy reading
set scrolloff=999       " focus mode like in Writer app http://www.iawriter.com/
set scrolloff=5         " focus mode like in Writer app http://www.iawriter.com/
set cursorline          " Подсветка строки, в которой находится в данный момент курсор
set cursorcolumn        " Подсветка столбца, в которой находится в данный момент курсор
set gcr=n:blinkon0      " Отключаем мигание курсора в MacVim. Больше никакого стресса.
set guioptions=         " Вырубаем все лишнее из ГУИ, если надо потогглить см <F6>
set t_Co=256            " Кол-во цветов
set guicursor=          " Отключаем мигание курсора
set splitbelow          " новый сплит будет ниже текущего :sp
set splitright          " новый сплит будет правее текущего :vsp
set switchbuf=split     " open buffer in split
set clipboard+=unnamedplus,unnamed,autoselect
set nopaste
set number                        " показываем нумерацию строк
set fileencodings=utf-8,cp1251    " Возможные кодировки файлов и последовательность определения
set encoding=utf-8                " character encoding used inside Vim.
set fileformat=unix               " unix format: crlf=cr
set viminfo='111,\"11111,:111,n~/.vim/viminfo

" Устанавливаем курсор в файле на место, где он был при закрытии этого файла
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" display unprintable characters
set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
" Символ табуляции и конца строки
	if has('multi_byte')
		if version >= 700
			set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:×
		else
			set listchars=tab:»\ ,trail:·,extends:>,precedes:<,nbsp:_
		endif
	endif
" Символ, который будет показан перед перенесенной строкой
	if has("linebreak")
		let &sbr = nr2char(8618).' '  " Show ↪ at the beginning of wrapped lines
	endif

" russian
set keymap=russian-jcukenwin
set iminsert=0          " default en lang
set imsearch=0          " default en lang for search
hi! CursorLineNr term=bold,reverse cterm=bold ctermfg=lightgray gui=bold guifg=lightgray
hi! lCursor term=bold,reverse cterm=bold ctermfg=Red guifg=NONE guibg=Red " russian color

" swp, undo, bak (backup)
let g:swp  = $HOME .'/.vim/.swp/'
let g:undo = $HOME .'/.vim/.undo/'
let g:bak  = $HOME .'/.vim/.bak/'
if exists( '*mkdir' )
	if !isdirectory(g:swp)  | call mkdir( g:swp,  'p', 0700 ) | endif
	if !isdirectory(g:undo) | call mkdir( g:undo,  'p', 0700 ) | endif
	if !isdirectory(g:bak)  | call mkdir( g:bak,  'p', 0700 ) | endif
endif
exe 'set backupdir='. g:bak .'/,/tmp//'
exe 'set directory='. g:swp .'/,/tmp//'
set backup
set writebackup
if exists( '+undofile' )
	exe "set undodir=" . g:undo .'/,/tmp//'
	set undofile
	set history=64
	set undolevels=1000
	set undoreload=10000
endif

" keys
let mapleader=","

nmap <silent> <BS> :NERDTreeToggle<CR>

" Вставлять код извне без этой строчки проблематично, без нее начитается
" бешеный реформат кода
set pastetoggle=<Leader>p

" <Space> = Page Down
nmap <Space> <C-f>

" Переключение по сплитам
nmap <C-h> <C-W>h
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l

" Y янкает от курсора и до конца строки. На манер страндартных D и С.
	nmap Y y$
	nmap <leader>y "tyy"tP
	vmap <leader>y "ty"tP'>

" reformat
	" retab
	vmap <Leader>rt :retab!<CR>
	nmap <Leader>rt :%retab!<CR>

" Clear the search highlight in Normal mode
nmap <silent> <Esc><Esc> :nohlsearch<cr>:set iminsert=0<CR><Esc>

" save file
map <silent>      <F2> <Esc><Esc>:w<CR>
map <silent>    <C-F2> <Esc><Esc>:w!<CR>
map <silent>    <S-F2> <Esc><Esc>:saveas <C-R>%
map <silent>  <C-S-F2> <Esc><Esc>:w !sudo tee %
" fast exit, for view/edit
map <silent>      <F3> <Esc><Esc>:q<CR>
map <silent>    <C-F3> <Esc><Esc>:call ConfirmCMD( 'q!', 'Force close?' )<CR>
map <silent>    <S-F3> <Esc><Esc>:bd<CR>
map <silent>  <C-S-F3> <Esc><Esc>:call ConfirmCMD( 'bd!', 'Force delete buffer?' )<CR>
map <silent>     <F10> <Esc><Esc>:qa<CR>
map <silent>   <C-F10> <Esc><Esc>:call ConfirmCMD( 'qa!', 'Force exit?' )<CR>
map <silent>   <S-F10> <Esc><Esc>:call ConfirmCMD( 'wqa', 'Save all and exit?' )<CR>
map <silent> <C-S-F10> <Esc><Esc>:call ConfirmCMD( 'wqa!', 'Force save all and exit?' )<CR>

" reload file
map      <F5> <Esc><Esc>:e<CR>
map    <S-F5> <Esc><Esc>:redraw!<CR>
map    <C-F5> <Esc><Esc>:call ConfirmCMD( 'e!', 'Force reload?' )<CR>

" Auto change the directory to the current file I'm working on
	au BufEnter * lcd %:p:h

" opens the .vimrc in a new tab
if has("gui_running")
	let $_VIMRC = $MYGVIMRC
" else
	let $_VIMRC = $MYVIMRC
endif
nmap <silent><leader>v :exe "tabedit " . $MYVIMRC<CR>
nmap <silent><leader>rv :echo "vimrc reload..." \| source $_VIMRC<CR>

