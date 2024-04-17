" Vim with all enhancements
" source $VIMRUNTIME/vimrc_example.vim
" Remap a few keys for Windows behavior
" source $VIMRUNTIME/mswin.vim
" Mouse behavior (the Windows way)
" behave mswin
" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
" if &diffopt !~# 'internal'
"   set diffexpr=MyDiff()
" endif
" function MyDiff()
"   let opt = '-a --binary '
"   if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"   if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"   let arg1 = v:fname_in
"   if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
"   let arg1 = substitute(arg1, '!', '\!', 'g')
"   let arg2 = v:fname_new
"   if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
"   let arg2 = substitute(arg2, '!', '\!', 'g')
"   let arg3 = v:fname_out
"   if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
"   let arg3 = substitute(arg3, '!', '\!', 'g')
"   if $VIMRUNTIME =~ ' '
"     if &sh =~ '\<cmd'
"       if empty(&shellxquote)
"         let l:shxq_sav = ''
"         set shellxquote&
"       endif
"       let cmd = '"' . $VIMRUNTIME . '\diff"'
"     else
"       let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
"     endif
"   else
"     let cmd = $VIMRUNTIME . '\diff'
"   endif
"   let cmd = substitute(cmd, '!', '\!', 'g')
"   silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
"   if exists('l:shxq_sav')
"     let &shellxquote=l:shxq_sav
"   endif
" endfunction


" vim-plug
call plug#begin()
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'easymotion/vim-easymotion'
  map  <Leader>f <Plug>(easymotion-bd-f)
  nmap <Leader>f <Plug>(easymotion-overwin-f)
  nmap s <Plug>(easymotion-overwin-f2)
  map <Leader>L <Plug>(easymotion-bd-jk)
  nmap <Leader>L <Plug>(easymotion-overwin-line)
  map  <Leader>w <Plug>(easymotion-bd-w)
  nmap <Leader>w <Plug>(easymotion-overwin-w)
Plug 'tomasiser/vim-code-dark'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline' 
Plug 'vim-airline/vim-airline-themes' 
Plug 'Yggdroot/indentLine'
  let g:indentLine_char = '│'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'vhda/verilog_systemverilog.vim'
Plug 'dense-analysis/ale'
  let g:ale_sign_error = '>>'
  let g:ale_sign_warning = '--'
Plug 'universal-ctags/ctags'
Plug 'preservim/tagbar'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
  let g:UltiSnipsExpandTrigger = '<tab>'
  let g:UltiSnipsJumpForwardTrigger = '<c-f>'
  let g:UltiSnipsJumpBackwardTrigger = '<c-b>'
  let g:UltiSnipsSnippetDirectories = ['UltiSnips']
  let g:UltiSnipsEditSplit="vertical"
Plug 'honza/vim-snippets'
call plug#end()


" airline config
let g:airline_theme = 'codedark'
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


" verilog config
packadd! matchit
let g:verilog_syntax_fold_lst = "all"
let g:SuperTabDefaultCompletionType = 'context'
set foldmethod=syntax
nnoremap <leader>i :VerilogFollowInstance<CR>
nnoremap <leader>I :VerilogFollowPort<CR>
" Let the matchit plugin know what items can be matched.
if exists("loaded_matchit")
  let b:match_ignorecase=0
  let b:match_words=
    \ '\<begin\>:\<end\>,' .
    \ '\<case\>\|\<casex\>\|\<casez\>:\<endcase\>,' .
    \ '\<module\>:\<endmodule\>,' .
    \ '\<if\>:\<else\>,' .
    \ '\<function\>:\<endfunction\>,' .
    \ '`ifdef\>:`else\>:`endif\>,' .
    \ '\<task\>:\<endtask\>,' .
    \ '\<specify\>:\<endspecify\>'
endif


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
set guifont=FiraMono\ Nerd\ Font\ Mono:h14
set pythonthreedll=python310.dll
set pythonthreehome=C:\Users\Zepto\scoop\apps\python310\3.10.11


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
xmap <leader>a :EasyAlign<cr>
noremap <silent> <F4> :set cursorline!<CR> 
noremap <leader>c <C-w>c
noremap <c-s> :w!<CR>
noremap <silent> <leader>d :bdelete<CR>
noremap <silent> <leader>p :bp<CR>
noremap <silent> <leader>n :bn<CR>
noremap <silent> <leader>/ :noh<CR>
noremap <silent> <leader>q :wq<CR>
noremap <silent> <leader>e :NERDTreeToggle<CR>
nnoremap <C-A> ggVG


colorscheme codedark
