#!/bin/sh

sudo ansible-galaxy install -r requirements.yml
sudo ansible-playbook "$@" -i inventory \
	--vault-password-file `pwd`/.vault_pass.txt main_computer.yml
