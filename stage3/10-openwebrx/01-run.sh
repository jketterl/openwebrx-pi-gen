#!/usr/bin/env bash
set -euo pipefail

# move openwebrx temporary file off into tmpfs (ramdisk)
mkdir "${ROOTFS_DIR}/tmp/openwebrx"
echo "tmpfs /tmp/openwebrx tmpfs defaults,noatime,nosuid,size=64m 0 0" >> "${ROOTFS_DIR}/etc/fstab"

cat << EOF > "${ROOTFS_DIR}/etc/openwebrx/openwebrx.conf.d/20-temporary-directory.conf"
[core]
temporary_directory = /tmp/openwebrx
EOF
