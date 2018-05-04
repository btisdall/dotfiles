#!/usr/bin/env bash

set -u

LNFLAG=i
if [ -n  "${FORCE_OVERWRITE:-}" ]; then
  LNFLAG=f
fi

ME=$(python -c 'import os; import sys; print(os.path.realpath(sys.argv[1]))' $0)
MYDIR=$(dirname ${ME})

cd ${MYDIR}
git submodule init && git submodule update

for i in $(git ls-files |cut -d/ -f1|sort -u); do
  [[ "$i" =~ ^\. ]] || continue
  [[ "$i" =~ ^.git(modules|ignore)$ ]] && continue
  [[ "$i" == ".pre-commit-config.yaml" ]] && continue
  (
    cd ${HOME}
    # || true kinda makes `set -e` pointless, but without this the whole thing
    # will abort if a user answers "no" to an overwrite.
    ln -snv${LNFLAG} ${MYDIR}/$i $i || true
  )
done

ln -snv${LNFLAG} ~/Dropbox/appsync/vim/spell .vim/spell
