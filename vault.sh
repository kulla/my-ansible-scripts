#!/bin/sh

SCRIPT=`readlink -f "$0"`
BASE_DIRNAME=`dirname "$SCRIPT"`

ansible-vault --vault-password-file="${BASE_DIRNAME}/.vault_pass.txt" "$@"
