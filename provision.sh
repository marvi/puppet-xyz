#!/bin/sh

rpm -Uvh https://yum.puppet.com/puppet5/puppet5-release-el-7.noarch.rpm

yum install puppet-agent -y
rpm --import /vagrant/GPG-KEY-elasticsearch

cat << EOF > /etc/yum.repos.d/elastic.repo
[elasticsearch]
name=Elasticsearch repository for 7.x packages
baseurl=https://artifacts.elastic.co/packages/7.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
EOF

/opt/puppetlabs/bin/puppet apply /vagrant/manifests/site.pp --codedir /vagrant
