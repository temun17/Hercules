#i/bin/bash

apt-get -y install openssh-server
sed -i 's/^.*Port 56969/ Port 22/' /etc/ssh/sshd_config
service sshd restart
