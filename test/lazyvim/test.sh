#!/bin/bash
# Copyright (c) 2026 Xavier Beheydt <xavier.beheydt@gmail.com>
set -e

# Test that LazyVim starter config was installed correctly.
#
# Run manually with:
#   devcontainer features test \
#     --features lazyvim     \
#     --remote-user root     \
#     --skip-scenarios       \
#     --base-image mcr.microsoft.com/devcontainers/base:ubuntu \
#     /path/to/this/repo

source dev-container-features-test-lib

check "lazyvim config dir exists" test -d "${HOME}/.config/nvim"
check "lazyvim init.lua exists"   test -f "${HOME}/.config/nvim/init.lua"
check "lazyvim lua dir exists"    test -d "${HOME}/.config/nvim/lua"

reportResults
