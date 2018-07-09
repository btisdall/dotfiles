def ec2i: .Reservations[].Instances[]|.Tags//=[];

def fuzztag(x): select(.Tags[]|(.Key==(x[1]//"Name")) and (.Value|test(x[0];"i")));

def ec2p: {
  name: (.Tags|from_entries["Name"]//""),
  id: .InstanceId,
  ippriv: .PrivateIpAddress,
  sshpriv: "ssh://ec2-user@\(.PrivateIpAddress)",
  ippub: .PublicIpAddress,
  sshpub: "ssh://ec2-user@\(.PublicIpAddress)",
  stack: .Tags|from_entries["aws:cloudformation:stack-name"],
  asg: .Tags|from_entries["aws:autoscaling:groupName"],
  launch: .LaunchTime,
  state: .State.Name,
};

