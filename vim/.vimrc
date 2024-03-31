" Enabling filetype support provides filetype-specific indenting,
" syntax highlighting, omni-completion and other useful settings.
filetype plugin indent on
syntax on

" `matchit.vim` is built-in so let's enable it!
" Hit `%` on `if` to jump to `else`.
runtime macros/matchit.vim

" various settings
set autoindent                 	" Minimal automatic indenting for any filetype.
set backspace=indent,eol,start 	" Intuitive backspace behavior.
set hidden                     	" Possibility to have more than one unsaved buffers.
set ruler                      	" Shows the current line number at the bottom-right
                               	" of the screen.
set number			" Show current line number.
set relativenumber		" Show relative line numbers.
set tabstop=4			" Number of columns per tab.
set expandtab			" Tab will change to spaces.
set encoding=utf-8		" Default to utf-8 encoding.
set mouse=a			" Activates mouse.
