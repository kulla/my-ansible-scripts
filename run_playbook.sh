#!/bin/sh

sudo ansible-playbook $@ -i computers \
	--vault-password-file `pwd`/.vault_pass.txt
