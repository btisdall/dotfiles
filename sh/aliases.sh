# shellcheck disable=SC2039
if [[ "$(uname -s)" == "Darwin" ]]; then
  alias o='open .'
  alias cp='\gcp'
  alias ls='\gls'
  alias readlink='\greadlink'
  alias md5sum='\gmd5sum'
  alias zcat='\gzcat'
  alias sed='\gsed'
  alias mkramdisk='diskutil erasevolume HFS+ RAMDISK $(hdiutil attach -nomount ram://524288) && cd /Volumes/RAMDISK'
  alias ejramdisk='diskutil eject RAMDISK'
  alias rsync='/usr/local/opt/rsync/bin/rsync'
fi

alias ks='kubectl sudo'

# jq
alias ec2p='jq ec2p'

# Jira
alias jm='jira mine'
alias jmc='jira mine-created'
alias jmb='jira mkbranch'

# VS Code
alias co='code .'
alias ch='charm .'

# Git - always
alias gs='git status'
alias gpo='git remote prune origin'
alias gsh='git show HEAD'
alias gl='git log'
alias gcmp='gcm && ggpull'
alias grbom='gfa && git rebase origin/master'
alias gbdd='git br -D'
alias ggg='git clone --recurse-submodules $(pbpaste)'

# Git - only when not under zsh
if [ -z "${ZSH_NAME}" ]; then
  alias gb='git branch'
  alias gcm='git checkout master'
  alias gcmp='git checkout master && git pull'
  alias gcn='git checkout next'
  alias gcnp='git checkout next && git pull'
  alias gfo='git fetch origin'
  alias gg='git grep'
  alias gp='git pull'
  alias gpo='git remote prune origin'
  alias gs='git st'
  alias gl="git log --pretty='format:%C(yellow)%h%C(reset)%nAuthor: %an <%ae>%n%C(green)Date: %cI%n%n%s%b%C(reset)%n'"
fi

# Docker
alias di='docker images'
alias dp='docker ps'
alias dra='docker rm -f $(docker ps -a -q)'
alias dri='docker rmi -f $(docker images -q -a -f dangling=true)'

# Ruby
alias pry='docker pull quay.io/btisdall/docker-pry && docker run --rm -ti quay.io/btisdall/docker-pry'

# Coreutils
alias l='ls --color'
alias la='ls -a --color'
alias ll='ls --color=auto -l'

# Misc
alias cv='asdf current'
alias mt='d=$(mktemp -d ~/me/delete-me-$(date +%FT%T)); cd $d && git init'
alias bu='brew upgrade'
alias diff='colordiff'
alias vjson="vim -c 'set ft=json' -"
alias c='clear'
alias jks='bundle exec jekyll serve'
alias gr='get_iplayer --type radio'
# shellcheck disable=SC2142
alias gw='netstat -rn -f inet|grep default|awk "{print \$2}"'
alias jv='json_verify <'
alias ping='ping -c10 -i1'
alias sfj='lftp sftp://${HOME_SERVER_EXTERNAL} -e "cd m4a"'
alias sfjl='lftp sftp://${HOME_SERVER_INTERNAL} -e "cd m4a"'
alias sj='ssh ${HOME_SERVER_EXTERNAL}'
alias sjl='ssh ${HOME_SERVER_INTERNAL}'
alias vy='ruby -rpp -ryaml -e "pp YAML.load(ARGF.read)"'
alias j2y="ruby -rjson -ryaml -e 'print JSON.parse(ARGF.read).to_yaml indentation:2'"

# shellcheck source=/dev/null
[ -f ~/.aliases_local ] && . ~/.aliases_local
