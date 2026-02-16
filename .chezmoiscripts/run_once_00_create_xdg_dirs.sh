#!/usr/bin/env bash
set -euo pipefail

echo "mkdir -p ${XDG_CONFIG_HOME} ${XDG_DATA_HOME} ${XDG_CACHE_HOME} ${XDG_STATE_HOME} ${XDG_BIN_HOME}"
mkdir -p ${XDG_CONFIG_HOME} ${XDG_DATA_HOME} ${XDG_CACHE_HOME} ${XDG_STATE_HOME} ${XDG_BIN_HOME}
