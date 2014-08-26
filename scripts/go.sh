#!/usr/bin/env bash

[[ -z "$1" ]] && { echo "!!! GitHub username not set. Check the Vagrant file."; exit 1; }

wget https://storage.googleapis.com/golang/go1.3.1.linux-amd64.tar.gz

sudo tar -C /usr/local -xzf go1.3.1.linux-amd64.tar.gz

sudo echo 'export PATH=$PATH:/usr/local/go/bin' >> /home/vagrant/.profile

mkdir -p /vagrant/go

echo "export GOPATH=/vagrant/go" >> /home/vagrant/.bash_profile
echo 'export PATH=$PATH:$GOPATH/bin' >> /home/vagrant/.bash_profile

sudo chown vagrant:vagrant /home/vagrant/.profile
sudo chown vagrant:vagrant /home/vagrant/.bash_profile

# source /home/vagrant/.bash_profile
# source /home/vagrant/.profile

mkdir -p $GOPATH/src/github.com/$1

mkdir $GOPATH/src/github.com/$1/hello

cp /vagrant/scripts/hello.go $GOPATH/src/github.com/$1/hello/hello.go

cd $GOPATH/src