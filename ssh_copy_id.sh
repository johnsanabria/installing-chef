#!/bin/bash
for i in "$@"; do
	ssh-copy-id -i ~/.ssh/id_rsa.pub ${i}
done
