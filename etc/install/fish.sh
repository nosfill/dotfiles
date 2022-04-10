#!/usr/bin/env bash
DOT_DIR="$HOME/dotfiles"

echo "=> [fish]"
type brew >/dev/null 2>&1
if [[ $? -eq 1 ]] ; then
    source ${DOT_DIR}/etc/install/linuxbrew.sh
fi

type fish >/dev/null 2>&1
if [[ $? -eq 1 ]] ; then
    echo "=> => install"
    brew install fish
fi
echo "=> [fish] complete"
