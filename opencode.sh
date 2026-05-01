#!/bin/sh

ROOT_DIR=$(dirname $(readlink -f $0))

nono run --workdir "$ROOT_DIR" \
  --profile my-opencode \
  --read "$ROOT_DIR" \
  --write "$ROOT_DIR/files" \
  --write-file "$ROOT_DIR/host_vars/main_computer/variables.yml" \
  --write-file "$ROOT_DIR/inventory" \
  --write-file "$ROOT_DIR/main_computer.yml" \
  --write-file "$ROOT_DIR/README.md" \
  --write-file "$ROOT_DIR/requirements.yml" \
  --write "$ROOT_DIR/roles" \
  --write "$ROOT_DIR/templates" \
  -- opencode
