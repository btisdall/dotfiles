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
# added by Anaconda3 5.3.1 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
# added by Anaconda3 5.3.1 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/tisdabe/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/tisdabe/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/tisdabe/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/tisdabe/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
