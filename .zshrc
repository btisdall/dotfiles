__source() {
  [[ -f "$1" ]] && . "$1"
}

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

autoload -U zmv
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="avit"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

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

DISABLE_MAGIC_FUNCTIONS=true

ZSH_CUSTOM="${HOME}/.zsh/omz-custom"

export GOPATH=${HOME}/go
export PATH=${HOME}/local/bin:${GOPATH}/bin:/usr/local/bin:/usr/local/sbin:${PATH}:"/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

for i in "${HOME}/.zsh/preload/"* ; do
  __source "$i"
done

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git bentis-git iterm2 docker kubectl)

source $ZSH/oh-my-zsh.sh

__source /usr/local/share/zsh/site-functions/aws_zsh_completer.sh

# User configuration

export NVM_DIR="${HOME}/.nvm"

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

set -o shwordsplit

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

_title(){
    local colour="$1"
    LABEL="${AWS_PROFILE}${AWS_DEFAULT_REGION:+:${AWS_DEFAULT_REGION}}"
    iterm2_tab_color_reset
    "_tab_${colour}"
    title "${LABEL}" "${LABEL}"
}

if type iterm2_tab_color >/dev/null; then
  source ${ZSH_CUSTOM}/iterm2-custom/colors.zsh
  precmd(){
    case "${AWS_PROFILE}" in
      core|live|legacy|*prod*)
        _title red
        ;;
      prelive|*jump*|*share*|jrd)
        _title orange
        ;;
      sandbox|playground|*dev*|*stage*)
        _title green
        ;;
      *)
        iterm2_tab_color_reset
        title $ZSH_THEME_TERM_TAB_TITLE_IDLE $ZSH_THEME_TERM_TITLE_IDLE
        ;;
    esac
}
fi

. /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

disable -r time

. ~/.asdf/asdf.sh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/benjamin.tisdall/.sdkman"
[[ -s "/Users/benjamin.tisdall/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/benjamin.tisdall/.sdkman/bin/sdkman-init.sh"
