" vundle: YCM | airline | nerdtree | Ultisnips | supertab | vim-node
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'ycm-core/YouCompleteMe'
  let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
  let g:ycm_use_ultisnips_completer = 1
  let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
  let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
  let g:ycm_autoclose_preview_window_after_insertion = 1
  let g:ycm_autoclose_preview_window_after_completion = 1
Plugin 'jiangmiao/auto-pairs'
Plugin 'tomasiser/vim-code-dark'
Plugin 'vim-airline/vim-airline' 
Plugin 'vim-airline/vim-airline-themes' 
Plugin 'ryanoasis/vim-devicons'
Plugin 'preservim/nerdtree'
Plugin 'dracula/vim', {'name': 'dracula'}
Plugin 'SirVer/ultisnips'
  let g:UltiSnipsExpandTrigger = '<tab>'
  let g:UltiSnipsJumpForwardTrigger = '<tab>'
  let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
  let g:UltiSnipsSnippetDirectories = ['UltiSnips']
  let g:UltiSnipsEditSplit="vertical"
Plugin 'honza/vim-snippets'
call vundle#end()
filetype plugin indent on


" airline config
let g:airline_theme = 'codedark'
let g:airline_section_warning = ''
let g:airline_section_b = '%{strftime("%c")}'
let g:airline_section_c = airline#section#create(['tagbar'])
let g:airline_section_x = '%{expand("%")}'
let g:airline#extensions#tagbar#enabled = 1
let g:airline_powerline_fonts = 1


" vim-plug: js/ts | vimtex | tex-conceal | nerd-commenter | vim-repl | copilot
call plug#begin('~/.vim/plugged')
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'branch': 'release/0.x',
  \ 'for': ['javascript', 'typescript', 'css', 'json', 'graphql', 'markdown']
  \ }
  let g:prettier#autoformat = 1

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
  let g:jsx_ext_required = 1
Plug 'mlaursen/vim-react-snippets'
Plug 'lervag/vimtex'
  let g:tex_flavor='latex'
  let maplocalleader = ","
  " Vimtex options
  let g:vimtex_quickfix_mode=0
  let g:vimtex_view_method='zathura'
  let g:vimtex_compiler_method = 'latexmk'

  " Compiler configuration
  let g:vimtex_compiler_latexmk = {
  \ 'continuous' : 1,
  \ 'callback' : 1,
  \ 'build_dir' : '',
  \ 'executable' : 'latexmk',
  \ 'options' : [
  \   '-verbose',
  \   '-file-line-error',
  \   '-shell-escape', 
  \   '-interaction=nonstopmode',
  \ ],
  \}
  let g:vimtex_compiler_latexmk_engines = {'_': '-xelatex'}
Plug 'KeitaNakamura/tex-conceal.vim'
  set conceallevel=2
  let g:tex_conceal='abdmgs'
  let g:tex_conceal_frac=1
  hi Conceal ctermbg=none
Plug 'preservim/nerdcommenter'
  let g:NERDCreateDefaultMappings=1
Plug 'sillybun/vim-repl'
  let g:repl_program = {
        \   'python': 'ipython3',
        \   'default': 'zsh',
        \   'r': 'R',
        \   'lua': 'lua',
        \   }
  let g:repl_predefine_python = {
        \   'numpy': 'import numpy as np',
        \   'matplotlib': 'from matplotlib import pyplot as plt'
        \   }
  let g:repl_cursor_down = 1
  let g:repl_python_automerge = 1
  let g:repl_ipython_version = '7'
nnoremap <leader>r :REPLToggle<Cr>
autocmd Filetype python nnoremap <F12> <Esc>:REPLDebugStopAtCurrentLine<Cr>
autocmd Filetype python nnoremap <F10> <Esc>:REPLPDBN<Cr>
autocmd Filetype python nnoremap <F11> <Esc>:REPLPDBS<Cr>
  let g:repl_position = 3
Plug 'prabirshrestha/vim-lsp'
call plug#end()


" vim-lsp config
if executable('rust-analyzer')
  au User lsp_setup call lsp#register_server({
        \   'name': 'Rust Language Server',
        \   'cmd': {server_info->['rust-analyzer']},
        \   'whitelist': ['rust'],
        \ })
endif
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
  augroup END


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
map <C-S> :w!<CR>

" 'Q' in normal mode enters Ex mode. You almost never want this.
nmap Q <Nop> 
nmap <F6> :NERDTreeToggle<CR>
nmap <F5> :!g++ % && ./a.out && rm ./a.out<CR>
nmap <localleader>v <plug>(vimtex-view)

" SET jj to <ESC> under insertion mode
imap jj <Esc>
imap kk <Esc>

noremap <silent> <F4> :set cursorline!<CR> 
noremap <space> za
nnoremap <C-A> ggVG

" 运行对应文件的映射
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!gcc % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    exec "!clear"
    exec "!time python3 %"
  elseif &filetype == 'html'
    exec "!time open % &"
  elseif &filetype == 'go'
    " exec "!go build %<"
    exec "!time go run %"
  elseif &filetype == 'javascript'
    exec "!clear"
    exec "!node %"
  endif
endfunc


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


colorscheme codedark
