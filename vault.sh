#!/bin/sh

SCRIPT=`readlink -f "$0"`
BASE_DIRNAME=`dirname "$SCRIPT"`

COMMAND="$1"
shift

ansible-vault "${COMMAND}" --vault-password-file="${BASE_DIRNAME}/.vault_pass.txt" "$@"
