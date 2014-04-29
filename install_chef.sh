#!/bin/bash
distro=""
if [ ! $# == 2 ]; then
	echo "Provides a distro (e.g. ubuntu or centos) and ssh end-point (e.g. someuser@somehost)"
	exit -1
else
	if [[ "${1}" == "ubuntu"  ||  "${1}" == "centos" ]]; then
		distro=${1}
	else
		echo "Distro is not supported ${1}"
		exit -1
	fi
fi
# Check if chef-solo is installed
ssh ${2} which chef-solo
if [ ! $? = 0 ]; then
	if [ "x$distro" == "xubuntu" ];  then
		scp chef__amd64.deb ${2}:.
		ssh ${2} sudo dpkg -i chef__amd64.deb
	else
		scp chef-11.4.0-1.el6.x86_64.rpm ${2}:.
		ssh ${2} sudo rpm -ivh chef-11.4.0-1.el6.x86_64.rpm
	fi
fi 
# Check if rsync is installed
ssh ${2} which rsync
if [ ! $? = 0 ]; then
	if [ "x$distro" == "xubuntu" ];  then
		ssh ${2} sudo apt-get install rsync
	else
		ssh ${2} sudo yum install rsync -y
	fi

fi
