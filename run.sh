#!/bin/sh

sudo ansible-playbook "$@" -i inventory \
	--vault-password-file `pwd`/.vault_pass.txt main_computer.yml
