#!/usr/bin/env bash
set -euo pipefail

BIN_NAME="nvim"
IMAGE_NAME="nvim-linux-x86_64.appimage"
DOWNLOAD_URL="https://github.com/neovim/neovim/releases/latest/download/${IMAGE_NAME}"

TARGET_DIR="${XDG_DATA_HOME}/${BIN_NAME}/bin"
TARGET_BIN="${TARGET_DIR}/${IMAGE_NAME}"
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
curl -fsSL ${DOWNLOAD_URL} -o ${TARGET_BIN}
chmod u+x ${TARGET_BIN}

# シンボリックリンクを作成
ln -sf ${TARGET_BIN} ${TARGET_DEPLOY}
