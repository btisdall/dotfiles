# NOTE: my .bashrc is somewhat abandonware these days.

PS1="\[\033[36m\]\u\[\033[0m\]@\[\033[33m\]\h\[\033[0m\]:\[\033[31m\]\w\[\033[0m\]\n$ "
export LS_OPTIONS='--color=auto'
shopt -s histappend

export GOPATH=$HOME/local/go
export PATH=$HOME/local/bin:$GOPATH/bin:/usr/local/bin:/usr/local/sbin:$PATH

if which gdircolors >/dev/null 2>&1; then
  eval $(gdircolors ~/src/dircolors-solarized/dircolors.256dark)
fi

complete -C aws_completer aws

if which brew >/dev/null 2>&1 && [ -f `brew --prefix`/etc/bash_completion.d/vagrant ]; then
    source `brew --prefix`/etc/bash_completion.d/vagrant
fi

[ -f ~/src/dotfiles/sh/aliases.sh ] && . ~/src/dotfiles/sh/aliases.sh
[ -f ~/src/dotfiles/sh/functions.sh ] && . ~/src/dotfiles/sh/functions.sh
[ -f ~/src/dotfiles/sh/exports.sh ] && . ~/src/dotfiles/sh/exports.sh
. "$HOME/.cargo/env"
