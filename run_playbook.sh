#!/bin/sh

ansible-playbook --ask-become-pass -i computers $@
