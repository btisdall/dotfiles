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
  cd "$(pbpaste|awk -F/ '{gsub("\.git$",""); print $NF}')"
}
