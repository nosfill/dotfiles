#!/usr/bin/env bash
DOT_DIR="$HOME/dotfiles"

ln -fs ${DOT_DIR}/config/fish/config.fish ~/.config/fish/config.fish
for i in $(find ${DOT_DIR}/config/fish/my_function/*.fish); do
    ln -fs ${i} ~/.config/fish/functions/$(basename ${i})
done