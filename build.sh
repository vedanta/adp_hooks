#!/bin/bash 

set -euo pipefail

name="redis"
type="salt"
salt_config="https://raw.githubusercontent.com/vedanta/sample_wp/master/conf/minion"
salt_config_dir="/srv/salt/conf"

entrypoint_salt(){
	echo "Installing saltstack"
   	rpm -qa | grep -qw salt-repo-latest || \
	yum -y install https://repo.saltstack.com/yum/redhat/salt-repo-latest-2.el7.noarch.rpm
	yum -y install epel-release
   	yum clean expire-cache 
	yum -y install salt-minion
	yum -y install GitPython
	yum -y install wget
   	mkdir -p $salt_config_dir
   	wget -c --directory-prefix=$salt_config_dir $salt_config 
   	# exec the base 
   	salt-call --config-dir=/srv/salt/conf --local state.apply
}
case $type in
    "salt")
        echo "Using type salt for entrypoint"
	entrypoint_salt
        ;;
    *)
        echo "Unknown type for entrypoint"
        ;;
esac
