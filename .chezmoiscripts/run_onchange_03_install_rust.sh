#!/usr/bin/env bash
set -euo pipefail

RUSTUP_DIR="${XDG_DATA_HOME}/rustup"
CARGO_DIR="${XDG_DATA_HOME}/cargo"

# Rust をアンインストール
[ -f "$CARGO_HOME/env" ] && . "$CARGO_HOME/env"
if command -v rustup >/dev/null 2>&1; then
  rustup self uninstall -y >/dev/null 2>&1
fi

if  [[ -d ${RUSTUP_DIR} ]] then
  rm -rf ${RUSTUP_DIR}
fi

if  [[ -d ${CARGO_DIR} ]] then
  rm -rf ${CARGO_DIR}
fi

# Rust をインストール
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y -q >/dev/null 2>&1

[ -f "$CARGO_HOME/env" ] && . "$CARGO_HOME/env"
