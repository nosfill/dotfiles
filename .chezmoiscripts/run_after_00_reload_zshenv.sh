#!/usr/bin/env bash
set -euo pipefail

touch "$HOME/.zshenv.local"
. "$HOME/.zshenv"
# . "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.zshrc"
