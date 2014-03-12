#!/bin/bash
for i in  "$@"; do
	./ssh_copy_id.sh ${i}
	./install_chef.sh ${i}
done
