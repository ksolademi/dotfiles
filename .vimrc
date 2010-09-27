syntax on
set nu
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set autoindent
set scrolloff=5
set hls
"set nosmartindent

colorscheme pablo

" To make it so smartindent doesn't unindent python comment lines 
" (lines beginning with '#')
:inoremap # X#

" For code completion.
filetype plugin on
set ofu=syntaxcomplete#Complete

" For Taglist plugin
filetype on
let Tlist_Show_Menu = 1  " In gvim show current tags in a menu named Tags
nnoremap <silent> <F8> :TlistToggle<CR>


au BufNewFile,BufRead *.py              call s:py_settings()

function! s:py_settings()
    set autoindent
    set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
endfun

set viminfo='20,\"500

" Go back to the last place we were looking at in the file
autocmd BufReadPost *
    \ if ! exists("g:leave_my_cursor_position_alone") |
    \     if line("'\"") > 0 && line ("'\"") <= line("$") |
    \         exe "normal g'\"" |
    \     endif |
    \ endif

map! <F2> from IPython.Shell import IPShellEmbed<CR>ipshell = IPShellEmbed()<CR>ipshell() 
