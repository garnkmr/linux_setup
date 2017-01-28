set nocompatible              " be iMproved, required
filetype off                  " required
set number
syntax on
set laststatus=2
set hlsearch
set incsearch
set ignorecase

" allow quit via single keypress (Q)
map Q :qa<CR>

" Use true colors.
if has("termguicolors")
set termguicolors
endif

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
nmap <F8> :TagbarToggle<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'valloric/youcompleteme'
Plug 'majutsushi/tagbar'
Plug 'vim-syntastic/syntastic'

" Initialize plugin system
call plug#end()

autocmd FileType c call SetPHPOptions()
function! SetPHPOptions()
	setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab makeprg=php-xdebug\ %
	    :call tagbar#autoopen(0)
    endfunction

autocmd FileType ruby call SetPHPOptions()
function! SetPHPOptions()
	setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab makeprg=php-xdebug\ %
	    :call tagbar#autoopen(0)
    endfunction

autocmd FileType javascript call SetPHPOptions()
function! SetPHPOptions()
	setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab makeprg=php-xdebug\ %
	    :call tagbar#autoopen(0)
    endfunction

autocmd FileType shell call SetPHPOptions()
function! SetPHPOptions()
	setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab makeprg=php-xdebug\ %
	    :call tagbar#autoopen(0)
    endfunction

autocmd FileType sh call SetPHPOptions()
function! SetPHPOptions()
	setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab makeprg=php-xdebug\ %
	    :call tagbar#autoopen(0)
    endfunction
