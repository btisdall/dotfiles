# NOTE: this file needs to autoload before aliases
export TERM="xterm-256color"
export QUOTING_STYLE=literal
export HISTCONTROL='ignorespace'
export HISTSIZE=5000
export HISTFILESIZE=10000
export LANG=en_GB.UTF-8
export EDITOR=vim
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
[ -f /usr/libexec/java_home ] && export JAVA_HOME="$(/usr/libexec/java_home)"
# Load non-verson-controlled stuff
[ -f ~/.work_vars ] && . ~/.work_vars
[ -f ~/.my_vars ] && . ~/.my_vars
