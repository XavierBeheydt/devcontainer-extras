#!/bin/sh
# Copyright (c) 2026 Xavier Beheydt <xavier.beheydt@gmail.com>
set -e

echo "Activating feature 'lazyvim'"

CONFIG_DIR="${_REMOTE_USER_HOME}/.config/nvim"

if [ -d "$CONFIG_DIR" ]; then
    echo "Existing nvim config found at $CONFIG_DIR — skipping LazyVim installation."
    exit 0
fi

echo "No nvim config found. Installing LazyVim starter..."

git clone https://github.com/LazyVim/starter "$CONFIG_DIR"
rm -rf "$CONFIG_DIR/.git"
chown -R "${_REMOTE_USER}:${_REMOTE_USER}" "$CONFIG_DIR"

echo "LazyVim installed at $CONFIG_DIR"
