if [[ -n "$ZSH_DEBUGRC" ]]; then
  zmodload zsh/zprof
fi

# https://vermaden.wordpress.com/2021/09/19/ghost-in-the-shell-part-7-zsh-setup/
# BASICS
  export EDITOR=vi
  export VISUAL=vi
  export MANWIDTH=tty
  export ENV=${HOME}/.shrc
  export IFCONFIG_FORMAT=inet:cidr
  export LC_COLLATE=C

  # https://unix.stackexchange.com/questions/119/colors-in-man-pages
  # https://unix.stackexchange.com/a/147
  export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # green
  export LESS_TERMCAP_md=$(tput bold; tput setaf 6) # cyan
  export LESS_TERMCAP_me=$(tput sgr0)
  export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4) # yellow on blue
  export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
  export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7) # white
  export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
  export LESS_TERMCAP_mr=$(tput rev)
  export LESS_TERMCAP_mh=$(tput dim)
  export LESS_TERMCAP_ZN=$(tput ssubm)
  export LESS_TERMCAP_ZV=$(tput rsubm)
  export LESS_TERMCAP_ZO=$(tput ssupm)
  export LESS_TERMCAP_ZW=$(tput rsupm)
  export GROFF_NO_SGR=1         # For Konsole and Gnome-terminal


# ZSH HISTORY
  #export HISTSIZE=655360
  #export HISTFILE=${HOME}/.zhistory
  #export SAVEHIST=${HISTSIZE}
  
  # +---------+
  # | HISTORY |
  # +---------+

  setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
  setopt SHARE_HISTORY             # Share history between all sessions.
  setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
  setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
  setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
  setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
  setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
  setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
  setopt HIST_VERIFY               # Do not execute immediately upon history expansion.

  setopt interactive_comments
  #setopt AUTO_CD              # Go to folder path without using cd.

  setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
  setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
  setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

  setopt CORRECT              # Spelling correction
  setopt CDABLE_VARS          # Change directory to a path stored in a variable.
  setopt EXTENDED_GLOB        # Use extended globbing syntax.




# ZSH LAST ARG FROM EARLIER COMMAND WITH [ALT]-[.]
  bindkey '\e.' insert-last-word
# ZSH BEGIN/END OF LINE
  bindkey "^A" beginning-of-line
  bindkey "^E" end-of-line
  bindkey "^[[1;5C" forward-word
  bindkey "^[[1;5D" backward-word
  bindkey "^[d" kill-word
  bindkey '^\'    accept-and-hold
  # UP DOWN to browser/search history based on current input
  # https://unix.stackexchange.com/a/285151
  autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
  zle -N up-line-or-beginning-search
  zle -N down-line-or-beginning-search
  # https://superuser.com/a/1296543
  bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search # Up, use C-v to found out
  bindkey "${terminfo[kcud1]}" down-line-or-beginning-search # Down
  #bindkey "$key[Up]" up-line-or-beginning-search
  #bindkey "$key[Down]" down-line-or-beginning-search
  
  # Alt-S to insert sudo to beginning
  insert_sudo() { zle beginning-of-line; zle -U "sudo " }
  zle -N insert-sudo insert_sudo
  bindkey '^[s'    insert-sudo
  # and Alt-D to insert doas
  insert_doas() { zle beginning-of-line; zle -U "doas " }
  zle -N insert-doas insert_doas
  bindkey '^[d'    insert-doas
  # Alt-3 to comment out current line
  insert_comment() { zle beginning-of-line; zle -U "# " }
  zle -N insert-comment insert_comment
  bindkey '^[3'    insert-comment

# ZSH COMPLETION CASE (IN)SENSITIVE
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# ZSH COMPLETION OPSTIONS
  zstyle ':completion:*' completer _expand _complete _correct _approximate _history
  zstyle ':completion:*' matcher-list '' '' 'l:|=* r:|=*' 'l:|=* r:|=*'
  zstyle ':completion:*' list-colors ''
  zstyle ':completion:*' users root
  zstyle ':completion:*' menu select
  zstyle :compinstall filename "$ZDOTDIR/.zshrc"

  autoload -Uz compinit
  for dump in ${ZDOTDIR}/.zcompdump(N.mh+24); do
      compinit
  done
  compinit -C
  # https://gist.github.com/ctechols/ca1035271ad134841284
  # negation, so that at least one exits on 0
  #[ ! "$(find ~/.zcompdump -mtime 1)" ] || compinit
  #compinit -C
  #if [ "$(find ~/.zcompdump -mtime 1)" ] ; then
  #  compinit
  #fi
  #compinit -C

  #autoload -Uz compinit
  autoload -U colors && colors
  #compinit
  autoload -U select-word-style
  select-word-style bash

  # https://askubuntu.com/a/1042242
  # COLOR grep(1)
  #export GREP_COLORS='ms=01;31;103'
  export GREP_COLORS='ms=01;37;41' 
  #export GREP_COLORS='ms=91:mc=91:sl=:cx=:fn=35:ln=32:bn=32:se=36'
  #export GREP_COLOR='1;32'
  #export GREP_COLORS='1;32'
  export GREP_OPTIONS='--color=auto'
  alias grep='grep --color=auto'
  alias egrep='egrep --color'

# SET ls(1) COLORS
  export LSCOLORS='exExcxdxcxexhxhxhxbxhx'
  #export LS_COLORS='no=00:fi=00:di=00;34:ln=00;36:pi=40;33:so=00;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00;32'
  export LS_COLORS='rs=0:di=38;5;27:ln=38;5;51:mh=44;38;5;15:pi=40;38;5;11:so=38;5;13:do=38;5;5:bd=48;5;232;38;5;11:cd=48;5;232;38;5;3:or=48;5;232;38;5;9:mi=05;48;5;232;38;5;15:su=48;5;196;38;5;15:sg=48;5;11;38;5;16:ca=48;5;196;38;5;226:tw=48;5;10;38;5;16:ow=48;5;10;38;5;21:st=48;5;21;38;5;15:ex=38;5;34:*.tar=38;5;9:*.tgz=38;5;9:*.arc=38;5;9:*.arj=38;5;9:*.taz=38;5;9:*.lha=38;5;9:*.lzh=38;5;9:*.lzma=38;5;9:*.tlz=38;5;9:*.txz=38;5;9:*.tzo=38;5;9:*.t7z=38;5;9:*.zip=38;5;9:*.z=38;5;9:*.Z=38;5;9:*.dz=38;5;9:*.gz=38;5;9:*.lrz=38;5;9:*.lz=38;5;9:*.lzo=38;5;9:*.xz=38;5;9:*.zst=38;5;9:*.bz2=38;5;9:*.bz=38;5;9:*.tbz=38;5;9:*.tbz2=38;5;9:*.tz=38;5;9:*.deb=38;5;9:*.rpm=38;5;9:*.jar=38;5;9:*.war=38;5;9:*.ear=38;5;9:*.sar=38;5;9:*.rar=38;5;9:*.alz=38;5;9:*.ace=38;5;9:*.zoo=38;5;9:*.cpio=38;5;9:*.7z=38;5;9:*.rz=38;5;9:*.cab=38;5;9:*.jpg=38;5;13:*.JPG=38;5;13:*.jpeg=38;5;13:*.gif=38;5;13:*.bmp=38;5;13:*.pbm=38;5;13:*.pgm=38;5;13:*.ppm=38;5;13:*.tga=38;5;13:*.xbm=38;5;13:*.xpm=38;5;13:*.tif=38;5;13:*.tiff=38;5;13:*.png=38;5;13:*.svg=38;5;13:*.svgz=38;5;13:*.mng=38;5;13:*.pcx=38;5;13:*.mov=38;5;13:*.mpg=38;5;13:*.mpeg=38;5;13:*.m2v=38;5;13:*.mkv=38;5;13:*.ogm=38;5;13:*.mp4=38;5;13:*.m4v=38;5;13:*.mp4v=38;5;13:*.vob=38;5;13:*.qt=38;5;13:*.nuv=38;5;13:*.wmv=38;5;13:*.asf=38;5;13:*.rm=38;5;13:*.rmvb=38;5;13:*.flc=38;5;13:*.avi=38;5;13:*.fli=38;5;13:*.flv=38;5;13:*.webm=38;5;13:*.gl=38;5;13:*.dl=38;5;13:*.xcf=38;5;13:*.xwd=38;5;13:*.yuv=38;5;13:*.cgm=38;5;13:*.emf=38;5;13:*.axv=38;5;13:*.anx=38;5;13:*.ogv=38;5;13:*.ogx=38;5;13:*.aac=38;5;45:*.au=38;5;45:*.flac=38;5;45:*.mid=38;5;45:*.midi=38;5;45:*.mka=38;5;45:*.mp3=38;5;45:*.m4a=38;5;45:*.mpc=38;5;45:*.ogg=38;5;45:*.opus=38;5;45:*.vorbis=38;5;45:*.3gp=38;5;45:*.ra=38;5;45:*.wav=38;5;45:*.axa=38;5;45:*.oga=38;5;45:*.spx=38;5;45:*.xspf=38;5;45:*~=38;5;244:'


# SET PROPER ENCODINGS
  case ${TERM} in
    (cons25*) export LC_ALL=en_US.UTF-8 ;;
    (*)       export LC_ALL=en_US.UTF-8     ;;
  esac

# ALIASES
  alias rehash='hash -r'
  alias make='env LANG=C LC_ALL=C make'
  #alias c='clear'
  alias wget='wget -c -t 0'

  #alias x='xinit ~/.xinitrc -- -dpi 75 -nolisten tcp 1> /dev/null 2> /dev/null'
  alias less='less -r --chop-long-lines -S --mouse --quit-if-one-screen'
  alias more='less -r --chop-long-lines -S --mouse --quit-if-one-screen'
  alias zl='/usr/share/vim/vim90/macros/less.sh'  # vim style less
  alias ssh='ssh -o LogLevel=quiet -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
  
  alias tn="tmux new -s MySn"
  alias ta="tmux a -t MySn"
  alias tb="tmux a -t BakSn"
  alias tka="tmux kill-session -t MySn"
  alias tkb="tmux kill-session -t BakSn"
  alias tl="tmux ls"
  #alias unzip='unzip -O gbk'
  alias screenfetch="screenfetch -t"
  alias neofetch="neofetch --distro_shorthand on --kernel_shorthand tiny --de_version on --disable title"
  alias R='R --no-save --no-restore-data'
  alias ha="notify-send -i /usr/share/icons/elementary-xfce/status/48/dialog-information.png -u low \"Hello World\""
  
  alias psc='ps xawf -eo pid,user,args'
  alias size='f(){ du -sh $1* | sort -hr; }; f'
  alias date='date "+%Y-%m-%d %H:%M:%S"'
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
  
  alias d='dirs -v | head -10'

  alias sl='TERM=gnome-256color ssh -YL 8787:localhost:8787 adam@10.11.17.2'

  # quietly open files with MuPDF
  function mp() { mupdf $1 &> /dev/null & }
  # system specific setting for ls and package manager
  case `uname` in
    (FreeBSD)
      alias ls='/bin/ls -F --color=always -D "%Y-%m-%d %H:%M"'
      
      alias up='doas pkg update -f'
      alias ug='doas pkg upgrade'
      alias search='pkg search'
      alias check="pkg info |grep"
      
      function check (){ pkg info |grep $1 }
      
      export BROWSER=firefox
      ;;
    (Linux)
      alias ls='/bin/ls -F --color=always --time-style=+"%Y-%m-%d %H:%M" --group-directories-first --quoting-style=literal'
      
      alias start="doas systemctl start"
      alias stop="doas systemctl stop"
      alias status="doas systemctl status"
      alias restart="doas systemctl restart"
      alias ug='doas apt upgrade --autoremove --purge'
      alias up='doas apt update'
      alias na='doas nala update'
      alias purge='doas apt purge --autoremove'
      alias autoremove='doas apt autoremove'
      alias search='apt search'
      alias show='apt show'

      alias cp='cp -v'
      alias mv='mv -v'

      alias ss1='TERM=gnome-256color ssh -YL 8787:localhost:8787 adam@10.11.17.2'
      
      function check (){ dpkg -l |grep $1 |awk '{ print $1"\t"$2":" $3}' |grep $1 }
      export BROWSER=firefox
      
      if /usr/bin/env which trash-put 1> /dev/null 2> /dev/null
      then
        alias rm="trash-put"
      fi
      ;;
  esac
  # then more for ls  
  alias l='ls'
  alias la='ls -A'
  alias ll='ls -lh'

# git branch support in command prompt
# see https://github.com/lilydjwg/dotzsh
if (( $+commands[git] )); then
  _nogit_dir=()
  for p in $nogit_dir; do
    [[ -d $p ]] && _nogit_dir+=$(realpath $p)
  done
  unset p

  _setup_current_branch_async () { # {{{4
    typeset -g _current_branch= vcs_info_fd=
    zmodload zsh/zselect 2>/dev/null

    _vcs_update_info () {
      eval $(read -rE -u$1)
      zle -F $1 && vcs_info_fd=
      exec {1}>&-
      # update prompt only when necessary to avoid double first line
      [[ -n $_current_branch ]] && zle reset-prompt
    }

    _set_current_branch () {
      _current_branch=
      [[ -n $vcs_info_fd ]] && zle -F $vcs_info_fd
      cwd=$(pwd -P)
      for p in $_nogit_dir; do
        if [[ $cwd == $p* ]]; then
          return
        fi
      done

      setopt localoptions no_monitor
      coproc {
        _br=$(git branch --no-color 2>/dev/null)
        if [[ $? -eq 0 ]]; then
          _current_branch=$(echo $_br|awk '$1 == "*" {print "%{\x1b[33m%} (" substr($0, 3) ")"}')
        fi
        # always gives something for reading, or _vcs_update_info won't be
        # called, fd not closed
        #
        # "typeset -p" won't add "-g", so reprinting prompt (e.g. after status
        # of a bg job is printed) would miss it
        #
        # need to substitute single ' with double ''
        print "typeset -g _current_branch='${_current_branch//''''/''}'"
      }
      disown %{\ _br 2>/dev/null
      exec {vcs_info_fd}<&p
      # wait 0.1 seconds before showing up to avoid unnecessary double update
      # precmd functions are called *after* prompt is expanded, and we can't call
      # zle reset-prompt outside zle, so turn to zselect
      zselect -r -t 10 $vcs_info_fd 2>/dev/null
      zle -F $vcs_info_fd _vcs_update_info
    }
  }

  _setup_current_branch_sync () { # {{{4
    _set_current_branch () {
      _current_branch=
      cwd=$(pwd -P)
      for p in $_nogit_dir; do
        if [[ $cwd == $p* ]]; then
          return
        fi
      done

      _br=$(git branch --no-color 2>/dev/null)
      if [[ $? -eq 0 ]]; then
        _current_branch=$(echo $_br|awk '{if($1 == "*"){print "%{\x1b[33m%} (" substr($0, 3) ")"}}')
      fi
    }
  } # }}}

  if [[ $_has_re -ne 1 ||
    $ZSH_VERSION =~ '^[0-4]\.' || $ZSH_VERSION =~ '^5\.0\.[0-5]' ]]; then
    # zsh 5.0.5 has a CPU 100% bug with zle -F
    _setup_current_branch_sync
  else
    _setup_current_branch_async
  fi
  typeset -gaU precmd_functions
  precmd_functions+=_set_current_branch
fi
# }}}
[[ -n $ZSH_PS_HOST && $ZSH_PS_HOST != \(*\)\  ]] && ZSH_PS_HOST="($ZSH_PS_HOST) "
setopt PROMPT_SUBST
# https://github.com/yonchu/shell-color-pallet
E=$'\x1b'
# COLOR LIST
# 30 - black     # 34 - blue
# 31 - red       # 35 - magenta
# 32 - green     # 36 - cyan
# 33 - yellow    # 37 - white
# COLOR PROMPT
case $( whoami ) in
    (root)
        cPMT="%F{pink}"
        ;;
    (*)
        cPMT="%F{yellow}"
        ;;
esac
export PS1="%F{196}%n%f%F{cyan}@%m%f: %F{blue}%U%~%u%f %F{249}%#%f "  # or PROMPT
PS2="%{${E}[2m%}(%_) >%{${E}[0m%} "
RPS1="%F{green}\$_current_branch%f %(1j.%j .)%F{green}@%U%T%u%f %(?.%B%F{cyan}v.%F{red}x)%b%f%${E}" # or RPROMPT
unset E

# source personal settings
source "${ZDOTDIR}/zsh_settings"

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if [[ -n "$ZSH_DEBUGRC" ]]; then
  zprof
fi
