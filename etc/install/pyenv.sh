#!/usr/bin/env bash
DOT_DIR="$HOME/dotfiles"

echo "=> [pyenv]"
type brew >/dev/null 2>&1
if [[ $? -eq 1 ]] ; then
    source ${DOT_DIR}/etc/install/linuxbrew.sh
fi

type pyenv >/dev/null 2>&1
if [[ $? -eq 1 ]] ; then
    echo "=> => install"
    brew install pyenv
fi
echo "=> [pyenv] complete"
