#!/bin/bash

apt-get -qy update
apt-get -qy upgrade

cp /vagrant/scripts/docker.settings /etc/default/docker
