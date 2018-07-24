execute 'source' fnamemodify(expand('<sfile>'), ':h').'/config/main.vim'

call plug#begin()
Plug 'arcticicestudio/nord-vim'
Plug 'derekwyatt/vim-scala'
Plug 'elmcast/elm-vim'
Plug 'valloric/youcompleteme', { 'do': './install.py' }
Plug 'OmniSharp/omnisharp-vim'
Plug 'oranget/vim-csharp'
Plug 'fsharp/vim-fsharp', { 'for': 'fsharp', 'do':  'make fsautocomplete' }
Plug 'ensime/ensime-vim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

imap fd <Esc>

autocmd BufWritePost *.scala silent :EnTypeCheck

let g:OmniSharp_server_path = '/home/elon3m/.SpaceVim.d/omnisharp-server/OmniSharp.exe'
let g:OmniSharp_server_use_mono = 1

let g:fsharp_completion_helptext = 1
let g:fsharpbinding_debug = 1
let g:fsharp_xbuild_path = "/usr/bin/msbuild"

let g:elm_detailed_complete = 1
autocmd FileType elm let g:deoplete#disable_auto_complete = 1
autocmd FileType cs let g:deoplete#disable_auto_complete = 1
let g:spacevim_enable_ycm = 1
let g:ycm_semantic_triggers = { 'elm' : ['.'], 'cs' : ['.'] }
