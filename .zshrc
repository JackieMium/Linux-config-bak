##########################################################################
##### EXPORT some ENV var ################################################
##########################################################################

# for R with MKL support
# see https://cran.r-project.org/doc/manuals/R-admin.html#MKL
export MKL_INTERFACE_LAYER=GNU,LP64
export MKL_THREADING_LAYER=GNU

# Lang and locale settings
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# JAVA related setttings
JAVA_HOME=/usr/lib/jvm/oracle-java8-jdk-amd64
JRE_HOME=/usr/lib/jvm/oracle-java8-jdk-amd64/jre
#JAVA_HOME=/usr/lib/jvm/oracle-java8-jdk-amd64/jre
LD_LIBRARY_PATH=$JRE_HOME/lib/amd64:$JRE_HOME/lib/amd64/server
#CLASSPATH=.:$JAVA_HOME/lib:$JRE_HOME/lib:$CLASSPATH
export JAVA_HOME JRE_HOME LD_LIBRARY_PATH

# remenber /sbin:/usr/sbin:/usr/local/sbin for root!
PATH=$PATH:$JAVA_HOME/bin:/opt/AppImage:/opt/bin:/home/adam/bin:/home/adam/.local/bin
export PATH

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
if [ "$TERM" = linux ]; then
        export LC_ALL=en_US.UTF-8
        export LANG=en_US.UTF-8
        export LANGUAGE=en_US.UTF-8
fi

if [ "$TERM" = "xterm-256color" ]; then
    export LC_ALL=en_US.UTF-8
	export LANG="en_US.UTF-8"
	export LANGUAGE="en_US"
fi


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/adam/Programs/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/adam/Programs/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/adam/Programs/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/adam/Programs/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# completion for Kitty terminal
kitty + complete setup zsh | source /dev/stdin

##########################################################################
##### Useful alias #######################################################
##########################################################################

# Tmux
alias tn="tmux new -s MySn"
alias ta="tmux a -t MySn"
alias tb="tmux a -t BakSn"
alias tka="tmux kill-session -t MySn"
alias tkb="tmux kill-session -t BakSn"
alias tl="tmux ls"

# Fix wrong codecs in ZIPs
alias unzip='unzip -O gbk'

# Beloved Gentoo logo
alias screenfetch="screenfetch -tw -A Gentoo"
alias neofetch="neofetch --memory_display infobar --ascii_distro Gentoo"

alias R='R --no-save --no-restore-data'
alias ha="notify-send -i ~/.icons/elementary/apps/16/utilities-terminal.svg -u low \"Hello World\""

alias ppp="curl -F 'vimcn=<-' https://cfp.vim-cn.com/"
alias rmdsk="udisksctl unmount -b /dev/sdc1 && udisksctl power-off -b /dev/sdc"

# systemd 
alias start="systemctl start"
alias stop="systemctl stop"
alias status="systemctl status"
alias restart="systemctl restart"

# apt
alias ug='sudo apt upgrade --autoremove'
alias up='sudo apt update'
alias purge='sudo apt purge --autoremove'
alias autoremove='sudo apt autoremove'
alias search='apt search'
alias show='apt show'

alias ls='ls --color=auto'
alias rm="trash-put"
alias psc='ps xawf -eo pid,user,cgroup,args'

function check (){ dpkg -l |grep $1 }


# rehash so that new installed cmd will be avialable ASAP
#zstyle ':completion:*' rehash true
zstyle ":completion:*:commands" rehash 1


# Path to your oh-my-zsh installation.
export ZSH=/home/adam/.oh-my-zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm


# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git extract colored-man-pages sudo)

source $ZSH/oh-my-zsh.sh
