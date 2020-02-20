#!/usr/bin/env bash
set -euo pipefail

# move openwebrx temporary file off into tmpfs (ramdisk)
mkdir "${ROOTFS_DIR}/tmp/openwebrx"
echo "tmpfs /tmp/openwebrx tmpfs defaults,noatime,nosuid,size=64m 0 0" >> "${ROOTFS_DIR}/etc/fstab"

cp "${ROOTFS_DIR}/etc/openwebrx/config_webrx.py" "${ROOTFS_DIR}/tmp/config_webrx.py"
sed 's/temporary_directory = "\/tmp"/temporary_directory = "\/tmp\/openwebrx"/' < "${ROOTFS_DIR}/tmp/config_webrx.py" > "${ROOTFS_DIR}/etc/openwebrx/config_webrx.py"
rm "${ROOTFS_DIR}/tmp/config_webrx.py"
