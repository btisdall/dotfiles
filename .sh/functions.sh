mkpasswd(){ echo -n "$1:$2:"; openssl passwd -1 -salt $(openssl rand -base64 6) $2; }
aa(){ wget $1 -U 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1468.0 Safari/537.36' -O "$2/cover.jpg"; }
vt() { aws cloudformation validate-template --template-body file://$1 --profile dev; }
ec2di() { aws ec2 describe-instances "$@" | jq ec2i; }
tiiasg(){ aws autoscaling terminate-instance-in-auto-scaling-group --no-should-decrement-desired-capacity --instance-id "$1"; }
desc(){ aws ec2 describe-instances --instance-ids "$1" | jq 'ec2i'; }
inst(){ ec2di | jq "fuzztag([\"$1\"]) | ec2p"; }
inst () {
	desc $1 | jq 'ec2p'
}
lower(){ tr '[:upper:]' '[:lower:]'; }
kn(){ export KUBE_NAMESPACE="${1:-default}"; }
knd(){ unset KUBE_NAMESPACE; }
ggg(){
  git clone --recurse-submodules "$(pbpaste)"
  cd "$(pbpaste|awk -F/ '{gsub("\\.git$",""); print $NF}')"
}

ssm_get(){ aws ssm get-parameter --name "$1" --with-decryption --output text --query Parameter.Value; }
ssm_ls(){ aws ssm get-parameters-by-path --path "$1" --recursive | jq '.Parameters[].Name' -r; }

psqll(){ psql "postgres://postgres:postgres@localhost/postgres" "$@"; }

gi(){ git init "$1"; cd "$1" && echo node_modules/ > .gitignore; npm init -y; }

diff(){ \diff -u "$@" | diff-so-fancy; }

oaToFc(){ jq --arg color ${1:-black} '.data|{type:"FeatureCollection",features:map({type:"Feature",geometry,properties:{stroke:$color,id}})}'; }
anch() { awk '{print "#"tolower}' | sed 's/ /-/g'; }
grp(){ grip "$1" & ; sleep 5 && open -a Safari.app http://localhost:6419/ ; wait; }
ue() { node -e 'process.stdout.write(encodeURIComponent(process.argv[1]))' "$@"; }
mbase(){ npm run test:base -- --fgrep "$@"; }
