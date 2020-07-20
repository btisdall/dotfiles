# NOTE: things here might need to load before omz autoloads some other things, eg when nvm loads up it needs to interpolcate the value of NPM_TOKEN in ~/.npmrc (if that file exists).
for i in .vars_local .aliases_local; do
  [[ -f "${HOME}/${i}" ]] && . "${HOME}/${i}"
done
