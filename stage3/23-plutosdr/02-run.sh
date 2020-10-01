#!/usr/bin/env bash
set -euxo pipefail

install -m 0644 files/90-libiio.rules "${ROOTFS_DIR}/etc/udev/rules.d/"
