# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
if [ "$TERM" = linux ]; then
        export LC_ALL=en_US.UTF-8
        export LANG=en_US.UTF-8
        export LANGUAGE=en_US.UTF-8
fi

if [ "$TERM" = "xterm-256color" ]; then
	export LANG="en_US.UTF-8"
	export LANGUAGE="en_US"
fi

function check (){
	dpkg -l |grep $1
}


# WCGNA multithreads support
export ALLOW_WGCNA_THREADS=4

alias ppp="curl -F 'vimcn=<-' https://cfp.vim-cn.com/"
alias ssr="python /home/adam/Downloads/shadowsocksr/shadowsocks/local.py -c /etc/shadowsocks_vultr.2.json -t 120"
alias R='R --no-save'
alias ss="ss-local -c /etc/shadowsocks-libev/vultr.json"

alias ha="notify-send \"Job Done. Let's Move On!\""


alias ug='sudo apt upgrade'
alias up='sudo apt update'
alias purge='sudo apt purge'
alias autoremove='sudo apt autoremove'
alias search='apt search'
alias show='apt show'

export JAVA_HOME=/usr/lib/jvm/oracle-java8-jdk-amd64/jre
export LD_LIBRARY_PATH=$JAVA_HOME/lib/amd64:$JAVA_HOME/lib/amd64/server


export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/home/adam/miniconda3/bin:/home/adam/Bioinformatics/Software/bin:$JAVA_HOME/bin:/usr/lib/jvm/oracle-java8-jdk-amd64/bin:/home/adam/.aspera/connect/bin:/home/adam/Bioinformatics/Software/FastQC:/home/adam/Bioinformatics/Software/bowtie2-2.3.1:/home/adam/Bioinformatics/Software/bowtie-1.2:/home/adam/Bioinformatics/Software/cufflinks-2.2.1.Linux_x86_64:/home/adam/Bioinformatics/Software/FastUniq:/home/adam/Bioinformatics/Software/tophat-2.1.1.Linux_x86_64:/home/adam/Bioinformatics/Software/fastx_toolkit_0.0.13_binaries_Linux_2.6_amd64:/home/adam/Bioinformatics/Software/samtools-1.4/bin:/home/adam/Bioinformatics/Software/bedtools2/bin/:/home/adam/Bioinformatics/Software/annovar:/home/adam/Bioinformatics/Software/RSEM-1.3.0:/home/adam/Bioinformatics/Software/VennPainter_x64
#:/home/adam/.TinyTeX/bin/x86_64-linux

#export PATH="/home/adam/miniconda3/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH=/home/adam/.oh-my-zsh


#EscEsc to sudo
sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    [[ $BUFFER != sudo\ * ]] && BUFFER="sudo $BUFFER"
    zle end-of-line
}
zle -N sudo-command-line
bindkey "\e\e" sudo-command-line

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

#export XMODIFIERS="@im=yong" 
#export GTK_IM_MODULE=xim 
#export QT_IM_MODULE=xim 

#export LANG=en_US.UTF-8
#export LANGUAGE=en_US.UTF-8
#export LC_CTYPE=en_US.UTF-8
#export LC_ALL=en_US.UTF-8

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm


# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
