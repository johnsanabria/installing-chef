#!/bin/bash
for i in  "$@"; do
	scp chef__amd64.deb ${i}:.
	ssh ${i} sudo dpkg -i chef__amd64.deb
done
