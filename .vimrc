" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim
" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark
" try color scheme in /usr/share/vim/vim81/colors
colorscheme  koehler


"""""""""""""""""""""""""""""""""""""""
" 这一部分参考阮一峰博客
"http://www.ruanyifeng.com/blog/2018/09/vimrc.html
"不与 Vi 兼容，采用 Vim 自己的操作命令
set nocompatible
" 显示行号
set nu
" 行号显示为相对行号
set relativenumber
" 高亮光标所在行
set cursorline
" 垂直滚动时，光标距离顶部/底部的行数
set scrolloff=5
" 是否显示状态栏。0 表示不显示，1 表示只在多窗口时显示，2 表示始终显示
set laststatus=2
" 在状态栏显示光标的当前位置坐标
set  ruler

" 打开语法高亮
syntax on
" 在底部显示，当前处于命令模式还是插入模式
set showmode
" 命令模式下，在底部显示当前键入的指令
set showcmd
" 支持使用鼠标
set mouse=a
" 使用 UTF-8 编码
set encoding=utf-8  
" 启用 256 色
set t_Co=256
" 开启文件类型检查，并且载入与该类型对应的缩进规则
filetype indent on
" 换行时新一行与上一行的缩进保持一致
set autoindent
" 按下 Tab 键时，Vim 显示的空格数
set tabstop=2
" 在文本上按下>>（增加一级缩进）、<<（取消一级缩进）或者
" ==（取消全部缩进）时，每一级的字符数
set shiftwidth=4
" 自动将 Tab 转为空格
set expandtab
" Tab 转为多少个空格
set softtabstop=2

" 光标遇到圆括号、方括号、大括号时，自动高亮对应的另一个圆括号、方括号和大括号
set showmatch
" 搜索时，高亮显示匹配结果
set hlsearch
" 输入搜索模式时，每输入一个字符，就自动跳到第一个匹配的结果
set incsearch
" 打开英语单词的拼写检查
" set spell spelllang=en_us
set nospell
" 不创建备份文件
set nobackup
" 保留撤销历史
" Vim 会在编辑时保存操作历史，用来供用户撤消更改
" 默认情况下，操作记录只在本次编辑时有效，一旦编辑结束、文件关闭，操作历史就消失了
" 打开这个设置，可以在文件关闭后，操作记录保留在一个文件里面，继续存在
" 这意味着，重新打开一个文件，可以撤销上一次编辑时的操作
" 撤消文件是跟原文件保存在一起的隐藏文件，文件名以 .un~ 开头
set undofile
" 设置备份文件、交换文件、操作历史文件的保存位置
" 结尾的 // 表示生成的文件名带有绝对路径，路径中用 % 替换目录分隔符，这样可以防止文件重名
set backupdir=~/.vim/.backup//  
set directory=~/.vim/.swp//
set undodir=~/.vim/.undo//
" 自动切换工作目录
" 这主要用在一个 Vim 会话之中打开多个文件的情况，默认的工作目录是打开的第一个文件的目录
" 该配置可以将工作目录自动切换到，正在编辑的文件的目录
set autochdir
" 出错时，不要发出蜂鸣提示
set noerrorbells
" 出错时，发出视觉提示
set visualbell
" Vim 需要记住多少次历史操作
set history=1000
" 打开文件监视
" 如果在编辑过程中文件发生外部改变会发出提示
set autoread
" 如果行尾有多余的空格（包括 Tab 键），该配置将让这些空格显示成可见的小方块
" set listchars=tab:»■,trail:■
" set list
" 命令模式下，底部操作指令按下 Tab 键自动补全
" 第一次按下 Tab，会显示所有匹配的操作指令的清单；第二次按下 Tab，会依次选择各个指令
set wildmenu
set wildmode=longest:list,full
""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Show non-printable characters
"set list
"if has('multi_byte') && &encoding ==# 'utf-8'
"  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
"else
"  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
"endif

" search down into subfolders
set path+=**
" Make backspace work as you would expect
set backspace=indent,eol,start 
" Show as much as possible of the last line
" https://stackoverflow.com/q/4621798
set display+=lastline
" cmd height in lines
set cmdheight=1

" when opening, files are "normal", i.e. not folded
set nofoldenable
" set foldmethod=manual
set foldlevel=2
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level


" Allow saving of files as sudo when I forgot to start vim using sudo
" the > /dev/null part explicitly throws away the standard output
cmap w!! w !sudo tee > /dev/null %


" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


" https://github.com/lilydjwg/dotvim/blob/master/vimrc
" bracketed paste mode support for tmux
if &term =~ '^screen\|^tmux' && exists('&t_BE')
  let &t_BE = "\033[?2004h"
  let &t_BD = "\033[?2004l"
  " t_PS and t_PE are key code options and they are special
  exec "set t_PS=\033[200~"
  exec "set t_PE=\033[201~"
endif
