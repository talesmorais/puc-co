#!/bin/bash

rm -rf ${JENKINS_HOME}/.ssh ${JENKINS_HOME}/.aws /root/.ssh /root/.aws /etc/sudoers.d
mkdir ${JENKINS_HOME}/.ssh ${JENKINS_HOME}/.aws /root/.ssh /root/.aws /etc/sudoers.d /etc/security/
echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/jenkins
echo -e "* hard nofile 65535\n* soft nofile 65535" >> /etc/security/limits.conf
echo -e "fs.file-max=65535\nnet.ipv6.conf.all.disable_ipv6 = 1\nnet.ipv6.bindv6only=1" >> /etc/sysctl.conf
echo -e "StrictHostKeyChecking=no\nHost GitHub\n  IdentityFile /var/jenkins_home/.ssh/id_rsa\n  User git\n  Port 22" >> /var/jenkins_home/.ssh/config
echo -e "StrictHostKeyChecking=no\nHost ssh.dev.azure.com\n  IdentityFile /var/jenkins_home/.ssh/id_rsa\n  User git\n  Port 22" >> /var/jenkins_home/.ssh/config
sed -i "s/#   StrictHostKeyChecking ask/    StrictHostKeyChecking no/g" /etc/ssh/ssh_config
sed -i "s/#   IdentityFile ~/.ssh/id_rsa/    IdentityFile ~/.ssh/git/g" /etc/ssh/ssh_config
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
