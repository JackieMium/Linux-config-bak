export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

export ALLOW_WGCNA_THREADS=4
export JAVA_HOME=/usr/lib/jvm/oracle-java8-jdk-amd64/jre
export LD_LIBRARY_PATH=$JAVA_HOME/lib/amd64:$JAVA_HOME/lib/amd64/server

alias beep="echo -ne '\007'"
alias R='R --no-save --no-restore-data'
alias ssr="python /home/adam/Downloads/shadowsocksr/shadowsocks/local.py -c /etc/shadowsocks_vultr.2.json -t 120"
alias ha="notify-send -i ~/.icons/elementary/apps/16/utilities-terminal.svg -u low \"Hello World\""
alias ppp="curl -F 'vimcn=<-' https://cfp.vim-cn.com/"

alias ug='sudo apt upgrade'
alias up='sudo apt update'
alias purge='sudo apt purge'
alias autoremove='sudo apt autoremove'
alias search='apt search'
alias show='apt show'
alias ls='ls --color=auto'

export BIO_PATH=/home/adam/Bioinformatics/Software
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:$BIO_PATH/bin:$JAVA_HOME/bin:/usr/lib/jvm/oracle-java8-jdk-amd64/bin:/home/adam/.aspera/connect/bin:$BIO_PATH/FastQC:$BIO_PATH/bowtie2-2.3.1:$BIO_PATH/bowtie-1.2:$BIO_PATH/cufflinks-2.2.1.Linux_x86_64:$BIO_PATH/FastUniq:$BIO_PATH/tophat-2.1.1.Linux_x86_64:$BIO_PATH/fastx_toolkit_0.0.13_binaries_Linux_2.6_amd64:$BIO_PATH/samtools/samtools/bin:$BIO_PATH/bedtools2/bin/:$BIO_PATH/annovar:$BIO_PATH/RSEM-1.3.0:$BIO_PATH/VennPainter_x64:$BIO_PATH/sratoolkit.2.9.0-ubuntu64/bin/:$BIO_PATH/pwiz/:$BIO_PATH/hisat2/hisat2-2.1.0/:$BIO_PATH/fastq_screen/fastq_screen/:$BIO_PATH/stringtie/stringtie:$BIO_PATH/gffcompare/gffcompare:/home/adam/Bioinformatics/Miniconda/bin



# Path to your oh-my-bash installation.
export OSH=/home/adam/.oh-my-bash

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-bash is loaded.
OSH_THEME="font"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_OSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

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

# Would you like to use another custom folder than $OSH/custom?
# OSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-bash/plugins/*)
# Custom plugins may be added to ~/.oh-my-bash/custom/plugins/
# Example format: plugins=(core rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(core git bashmarks progress)

if tty -s
then
  source $OSH/oh-my-bash.sh
fi

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

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

# Set personal aliases, overriding those provided by oh-my-bash libs,
# plugins, and themes. Aliases can be placed here, though oh-my-bash
# users are encouraged to define aliases within the OSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias bashconfig="mate ~/.bashrc"
# alias ohmybash="mate ~/.oh-my-bash"
