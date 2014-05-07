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
./ssh_copy_id.sh ${2}
./install_chef.sh ${distro} ${2}
