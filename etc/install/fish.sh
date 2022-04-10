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

    echo "=> => [fisher] add plugin manager"
    fish -c "curl -sL git.io/fisher | source && fisher install jorgebucaran/fisher"

    echo "=> => [pure] add"
    fish -c "fisher install pure-fish/pure"

    echo "=> => [pyenv] add"
    fish -c "fisher install daenney/pyenv"
fi
echo "=> [fish] complete"
