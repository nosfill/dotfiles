#!/usr/bin/env bash

echo "=> [Rust]"
CARGO_DIR=$HOME/.cargo/bin
if [[ ! -d ${CARGO_DIR} ]] ; then
    echo "=> => install"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

    # echo "=> => export path"
    # source $HOME/.cargo/env
    # source $HOME/.bashrc
fi
echo "=> [Rust] complete"
