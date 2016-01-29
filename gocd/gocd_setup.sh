#!/bin/bash -e
# note: requires sudo

echo "
[gocd]
name            = GoCD YUM Repository
baseurl         = http://dl.bintray.com/gocd/gocd-rpm
enabled         = 1
gpgcheck        = 0
" > /etc/yum.repos.d/thoughtworks-go.repo

yum check-update

yum install -y java-1.7.0-openjdk go-server go-agent

/etc/init.d/go-server start

/etc/init.d/go-agent start
