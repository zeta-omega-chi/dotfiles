" vim-plug: 
call plug#begin()
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'
let g:easy_align_delimiters = {
\ '>': { 'pattern': '>>\|=>\|>' },
\ '/': {
\     'pattern':         '//\+\|/\*\|\*/',
\     'delimiter_align': 'l',
\     'ignore_groups':   ['!Comment'] },
\ ']': {
\     'pattern':       '[[\]]',
\     'left_margin':   0,
\     'right_margin':  0,
\     'stick_to_left': 0
\   },
\ ')': {
\     'pattern':       '[()]',
\     'left_margin':   0,
\     'right_margin':  0,
\     'stick_to_left': 0
\   },
\ 'd': {
\     'pattern':      ' \(\S\+\s*[;=]\)\@=',
\     'left_margin':  0,
\     'right_margin': 0
\   }
\ }
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline' 
Plug 'vim-airline/vim-airline-themes' 
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories = ['UltiSnips']
let g:UltiSnipsEditSplit="vertical"
Plug 'honza/vim-snippets'
Plug 'ycm-core/YouCompleteMe'
let g:ycm_use_ultisnips_completer = 1
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
call plug#end()


" airline config
let g:airline_theme = 'onedark'
let g:airline_section_warning = ''
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 1        "显示buffer编号
let g:airline#extensions#tabline#buffer_nr_format = '%s:'
let g:airline#extensions#battery#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''


" sets
syntax on
filetype indent plugin on
set encoding=utf-8
set nocompatible
set shortmess+=I
set number
set relativenumber
set laststatus=2
set backspace=indent,eol,start
set hidden
set ignorecase
set smartcase
set incsearch
set noerrorbells visualbell t_vb=
set mouse+=a
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
" set cursorline!
set foldmethod=manual


" auto-save fold views
augroup AutoSaveFolds
  autocmd!
  autocmd BufWinLeave ?* mkview
  autocmd BufWinEnter ?* silent loadview
augroup END


" key mappings
let mapleader=','
map <C-S> :w!<CR>
" 'Q' in normal mode enters Ex mode. You almost never want this.
nmap Q <Nop> 
" SET jj to <ESC> under insertion mode
imap jj <Esc>
imap jk <Esc>
noremap <space> za
noremap <silent> <leader>d :bdelete<CR>
noremap <silent> <leader>p :bp<CR>
noremap <silent> <leader>n :bn<CR>
noremap <silent> <leader>/ :noh<CR>
noremap <silent> <leader>q :wq<CR>
noremap <leader>e :NERDTreeToggle<CR>
noremap <leader>f :NERDTreeFind<CR>
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" Cursor in terminal
" https://vim.fandom.com/wiki/Configuring_the_cursor
" 1 or 0 -> blinking block
" 2 solid block
" 3 -> blinking underscore
" 4 solid underscore
" Recent versions of xterm (282 or above) also support
" 5 -> blinking vertical bar
" 6 -> solid vertical bar

if &term =~ '^xterm'
  " normal mode
  let &t_EI .= "\<Esc>[2 q"
  " insert mode
  let &t_SI .= "\<Esc>[5 q"
endif


colorscheme onedark

