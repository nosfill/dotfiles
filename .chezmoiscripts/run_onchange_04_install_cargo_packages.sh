#!/usr/bin/env bash
set -euo pipefail

PACKAGES_FILE="${XDG_CONFIG_HOME:-$HOME/.config}/cargo/packages.toml"

if [ ! -f "$PACKAGES_FILE" ]; then
  echo "No cargo packages file found."
  exit 0
fi

if ! command -v toml >/dev/null 2>&1; then
  cargo install toml-cli --locked
fi

if ! command -v cargo-binstall >/dev/null 2>&1; then
  cargo install cargo-binstall --locked
fi

echo "Reading packages..."

echo $(toml get "$PACKAGES_FILE" packages.tools)
length=$(toml get ~/.config/cargo/packages.toml packages.tools | jq -r '.[]' | wc -l)

for ((i=0; i<length; i++)); do
  pkg=$(toml get ~/.config/cargo/packages.toml packages.tools | jq -r ".[$i]")

  name="${pkg%@*}"
  version="${pkg#*@}"

  installed_version=$(cargo install --list \
    | awk -v n="$name" '$1==n {gsub(/^v/,"",$2); print $2}')

  if [ "$installed_version" = "$version" ]; then
    echo "$name@$version already installed."
    continue
  fi

  echo "Installing $name@$version..."

  if cargo binstall "$name" --version "$version" --force --no-confirm; then
    echo "Installed via cargo-binstall."
  else
    cargo install "$name" --version "$version" --locked
  fi
done

echo "Done."
