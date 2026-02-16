#!/usr/bin/env bash
set -euo pipefail

BIN_NAME="lazygit"
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
IMAGE_NAME="lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
DOWNLOAD_URL="https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/${IMAGE_NAME}"

TARGET_DIR="${XDG_DATA_HOME}/${BIN_NAME}/bin"
TARGET_BIN="${TARGET_DIR}/${BIN_NAME}"
TARGET_DEPLOY="${XDG_BIN_HOME}/${BIN_NAME}"

# バイナリの保存先をリセット
if [[ -d ${TARGET_DIR} ]]; then
  rm -rf ${TARGET_DIR}
fi
mkdir -p ${TARGET_DIR}

# 既存のシンボリックリンクを削除
if [[ -f ${TARGET_DEPLOY} && -L ${TARGET_DEPLOY} ]]; then
    unlink ${TARGET_DEPLOY}
fi

# バイナリをダウンロードして実行権限を付与
curl -fsSL ${DOWNLOAD_URL} | tar -xzC ${TARGET_DIR}

# シンボリックリンクを作成
ln -sf ${TARGET_BIN} ${TARGET_DEPLOY}
