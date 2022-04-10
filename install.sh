#!/usr/bin/env bash
DOT_DIR="$HOME/dotfiles"

# Retrive repository (If git is not availabe, use curl)
if [ ! -d ${DOT_DIR} ]; then
    type curl >/dev/null 2>&1
    IS_CURL=$?
    type wget >/dev/null 2>&1
    IS_WGET=$?

    type git >/dev/null 2>&1
    if [[ $? -eq 0 ]] ; then
        git clone https://github.com/nosfill/dotfiles.git ${DOT_DIR}
    elif [[ ${IS_CURL} -eq 0 || ${IS_WGET} -eq 0 ]] ; then
        TARBALL="https://github.com/nosfill/dotfiles/archive/master.tar.gz"

        if [[ ${IS_CURL} -eq 0 ]]; then
            curl -L ${TARBALL} -o master.tar.gz
        else
            wget ${TARBALL}
        fi

        tar -zxvf master.tar.gz
        rm -f master.tar.gz
        mv -f dotfiles-master "${DOT_DIR}"
    else
        echo "curl or wget or git required"
        exit 1
    fi
fi

# Install software
CANDIDATE=( linuxbrew pyenv fish rust )
for i in ${CANDIDATE[@]}; do
    echo "source ${DOT_DIR}/etc/install/${i}.sh"
    source ${DOT_DIR}/etc/install/${i}.sh
done

# Deploy dotfiles
# source ${SCRIPT_DIR}etc/install/linuxbrew.sh
