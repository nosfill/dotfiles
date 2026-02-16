#!/usr/bin/env bash
set -euo pipefail

if command -v zsh >/dev/null 2>&1; then
  echo "[BeforeScript][zsh] zsh already installed"
else
  echo "[BeforeScript][zsh] Installing zsh..."

  if command -v apt >/dev/null 2>&1; then
    sudo apt update
    sudo apt install -y zsh
  elif command -v pacman >/dev/null 2>&1; then
    sudo pacman -Sy --noconfirm zsh
  elif command -v dnf >/dev/null 2>&1; then
    sudo dnf install -y zsh
  else
    echo "[BeforeScript][zsh] Unsupported package manager"
    exit 1
  fi
fi

# デフォルトシェルをzshに変更
if [ "$SHELL" != "$(command -v zsh)" ]; then
  echo "[BeforeScript][zsh] Changing default shell to zsh..."
  chsh -s "$(command -v zsh)"
else
  echo "[BeforeScript][zsh] zsh already default shell"
fi

echo "[BeforeScript][zsh] zsh setup complete."
