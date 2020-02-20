#!/usr/bin/env bash
set -euo pipefail

install -m 644 files/openwebrx.list "${ROOTFS_DIR}/etc/apt/sources.list.d/"

on_chroot apt-key add - < files/openwebrx.gpg.key
on_chroot << EOF
apt-get update
EOF
