syntax on	    	" enables syntax highlighting by default.
set nu                  " show line number
set laststatus  =2	" Always show statusline.
set hlsearch		" Keep matches highlighted.
set incsearch           " Highlight while searching with / or ?.
set cursorline		" highlight current line
set nocp		" no compatible
set ruler		"show cursor position at bottom right
set backspace   =indent,eol,start  " Make backspace work as you would expect.
set display     =lastline  " Show as much as possible of the last line.
set showmode               " Show current mode in command-line.
set showcmd                " Show already typed keys when more are expected.
set autoindent
set expandtab		" space instead of tab
set softtabstop =4	" Tab key indents by 4 spaces.
set shiftwidth  =4	" >> indents by 4 spaces.
set backspace   =indent,eol,start  " Make backspace work as you would expect.
set mouse=a		" Enable mouse usage (all modes)

set foldmethod=manual
set foldlevel=2
set nofoldenable
set list                   " Show non-printable characters.

if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set autowrite		" Automatically save before commands like :next and :make

filetype plugin indent on

"filetype plugin on
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'cjrh/vim-conda'
" Make sure you use single quotes
" Initialize plugin system
call plug#end()

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1


" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
 set background=dark
" set background=light

" try color scheme in /usr/share/vim/vim81/colors
" colorscheme desert

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif


" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

if &term =~ '^screen\|^tmux' && exists('&t_BE')
  let &t_BE = "\033[?2004h"
  let &t_BD = "\033[?2004l"
  " t_PS and t_PE are key code options and they are special
  exec "set t_PS=" . "\033[200~"
  exec "set t_PE=" . "\033[201~"
endif
