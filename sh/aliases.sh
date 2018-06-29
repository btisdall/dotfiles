if [[ "$(uname -s)" == "Darwin" ]]; then
  alias cp='\gcp'
  alias ls='\gls'
  alias readlink='\greadlink'
  alias md5sum='\gmd5sum'
  alias zcat='\gzcat'
  alias sed='\gsed'
  alias mkramdisk='diskutil erasevolume HFS+ RAMDISK $(hdiutil attach -nomount ram://524288) && cd /Volumes/RAMDISK'
  alias ejramdisk='diskutil eject RAMDISK'
fi

if [[ "${USER}" == "${WORK_USER}" ]]; then
  alias sudo='sudo -A'
fi

alias co='code . -r'
# Git - always
alias gs='git status'
alias gsh='git show HEAD'
alias gl='git log'

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
alias installeslint="yarn add --dev \$(npm info eslint-config-airbnb@latest peerDependencies --json|jq '[to_entries[]|[.key,.value]|join(\"@\")]|join(\" \")' -r) eslint-config-airbnb@latest"
alias bu='brew upgrade && brew cleanup'
alias diff='colordiff'
alias vjson="vim -c 'set ft=json' -"
alias c='clear'
alias jks='bundle exec jekyll serve'
alias gr='get_iplayer --type radio'
alias gw='netstat -rn -f inet|grep default|awk "{print \$2}"'
alias jv='json_verify <'
alias ping='ping -c10 -i1'
alias sfj='lftp sftp://${HOME_SERVER_EXTERNAL} -e "cd m4a"'
alias sfjl='lftp sftp://${HOME_SERVER_INTERNAL} -e "cd m4a"'
alias sj='ssh ${HOME_SERVER_EXTERNAL}'
alias sjl='ssh ${HOME_SERVER_INTERNAL}'
alias vy='ruby -rpp -ryaml -e "pp YAML.load(ARGF.read)"'
alias j2y="ruby -rjson -ryaml -e 'print JSON.parse(ARGF.read).to_yaml indentation:2'"

[ -f ~/.aliases_local ] && . ~/.aliases_local
