#!/usr/bin/env bash

echo "=> [linuxbrew]"
type brew >/dev/null 2>&1
if [[ $? -eq 1 ]] ; then
    echo "=> => install"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    echo "=> => export path"
    PROFILE=~/.profile
    if [ -r ~/.bash_profile ]; then
        PROFILE=~/.bash_profile
    fi
    BREW=~/.linuxbrew/bin/brew
    if [ -d /home/linuxbrew/.linuxbrew ]; then
        BREW=/home/linuxbrew/.linuxbrew/bin/brew
    fi
    eval "$(${BREW} shellenv)"
    echo "eval \"\$(${BREW} shellenv)\"" >> ${PROFILE}
fi

echo "=> => brew doctor"
brew doctor

echo "=> => brew update"
brew update

echo "=> [linuxbrew] complete"
