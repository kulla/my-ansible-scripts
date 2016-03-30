#!/bin/sh

ansible-playbook --ask-become-pass -i computers main_computer.yml
