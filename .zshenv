export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

export JAVA_HOME=/usr/lib/jvm/oracle-java8-jdk-amd64/jre
export LD_LIBRARY_PATH=$JAVA_HOME/lib/amd64:$JAVA_HOME/lib/amd64/server

# ZSH HISTORY
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTSIZE=655360
export HISTFILE="$ZDOTDIR/zhistory"
export SAVEHIST=${HISTSIZE}
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.

# PATH
#export PATH="$COMPOSER_HOME/vendor/bin:$PATH"                       # COMPOSER
export PATH="$PATH:$JAVA_HOME/bin"

#GTK_MODULES="$GTK_MODULES:canberra-gtk-module"
#export GTK_MODULES

# Get color support for 'less'
export LESS="--RAW-CONTROL-CHARS"

# Use colors for less, man, etc.
[[ -f ~/.LESS_TERMCAP ]] && source ~/.LESS_TERMCAP
