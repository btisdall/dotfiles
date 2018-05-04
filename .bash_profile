# NOTE: my .bash_profile is somewhat abandonware these days.
[ -f ~/.bashrc ] && . ~/.bashrc

export PATH=$HOME/local/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:/usr/local/sbin:$PATH

if which pyenv > /dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

if which rbenv > /dev/null 2>&1; then eval "$(rbenv init -)"; fi

if which brew > /dev/null 2>&1 && [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export NVM_DIR="$HOME/.nvm"
[ -f /usr/local/opt/nvm/nvm.sh ] && . /usr/local/opt/nvm/nvm.sh
