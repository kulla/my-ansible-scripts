#!/bin/sh

ARCH="$1"
TARGET="$2"

mkdir -p "$TARGET" || exit 1
cd "$TARGET" || exit 1
wget -O - "https://www.dropbox.com/download?plat=lnx.${ARCH}" | tar xzf - || exit 1
mv .dropbox-dist/* . || exit 1
rmdir .dropbox-dist || exit 1
