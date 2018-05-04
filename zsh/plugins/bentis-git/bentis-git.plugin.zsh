# Display the fully-qualified repo name as part of the prompt

function git_prompt_info() {
  local ref url repo
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    url="$(command git remote show origin -n|grep Fetch)"
    if echo "${url}" | grep -Eq https?://; then
      repo="$(echo ${url}|awk -F/ '{print $(NF-1)"/"$NF}')"
    else
      repo="$(echo ${url}|awk -F: '{print $NF}')"
    fi
    repo="${repo%%.git} > "
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${repo}${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}
