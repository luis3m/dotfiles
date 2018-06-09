execute 'source' fnamemodify(expand('<sfile>'), ':h').'/config/main.vim'

call plug#begin()
Plug 'arcticicestudio/nord-vim'
Plug 'derekwyatt/vim-scala'
call plug#end()

imap fd <Esc>
