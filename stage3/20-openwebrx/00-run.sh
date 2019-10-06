#!/usr/bin/env bash
set -euxo pipefail

git clone https://github.com/jketterl/openwebrx.git "${ROOTFS_DIR}/opt/openwebrx"

install -m 644 files/openwebrx.service	"${ROOTFS_DIR}/etc/systemd/system/openwebrx.service"

on_chroot << EOF
systemctl enable openwebrx
EOF

# move openwebrx temporary file off into tmpfs (ramdisk)
mkdir "${ROOTFS_DIR}/tmp/openwebrx"
echo "tmpfs /tmp/openwebrx tmpfs defaults,noatime,nosuid,size=64m 0 0" >> "${ROOTFS_DIR}/etc/fstab"

mv "${ROOTFS_DIR}/opt/openwebrx/config_webrx.py" "${ROOTFS_DIR}/opt/openwebrx/config_webrx.py.orig"
sed 's/temporary_directory = "\/tmp"/temporary_directory = "\/tmp\/openwebrx"/' < "${ROOTFS_DIR}/opt/openwebrx/config_webrx.py.orig" > "${ROOTFS_DIR}/opt/openwebrx/config_webrx.py"