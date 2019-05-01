#!/bin/sh

sudo ansible-galaxy install -r requirements.yml
sudo ansible-playbook "$@" -i computers \
	--vault-password-file `pwd`/.vault_pass.txt
