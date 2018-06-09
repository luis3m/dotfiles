execute 'source' fnamemodify(expand('<sfile>'), ':h').'/config/main.vim'

call plug#begin()
Plug 'arcticicestudio/nord-vim'
Plug 'derekwyatt/vim-scala'
Plug 'elmcast/elm-vim'
Plug 'valloric/youcompleteme'
call plug#end()

imap fd <Esc>

let g:elm_detailed_complete = 1
let g:deoplete#disable_auto_complete=1
let g:spacevim_enable_ycm = 1
let g:ycm_semantic_triggers = { 'elm' : ['.'] }
