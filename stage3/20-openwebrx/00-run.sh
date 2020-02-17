#!/usr/bin/env bash
set -euxo pipefail

git clone https://github.com/jketterl/openwebrx.git "${ROOTFS_DIR}/opt/openwebrx"

on_chroot << EOF
adduser --system --group --no-create-home --home /nonexistant openwebrx
usermod -aG plugdev openwebrx
EOF

install -m 644 files/openwebrx.service	"${ROOTFS_DIR}/etc/systemd/system/openwebrx.service"

on_chroot << EOF
systemctl enable openwebrx
EOF

# move openwebrx temporary file off into tmpfs (ramdisk)
mkdir "${ROOTFS_DIR}/tmp/openwebrx"
echo "tmpfs /tmp/openwebrx tmpfs defaults,noatime,nosuid,size=64m 0 0" >> "${ROOTFS_DIR}/etc/fstab"

mkdir -p ${ROOTFS_DIR}/etc/openwebrx
sed 's/temporary_directory = "\/tmp"/temporary_directory = "\/tmp\/openwebrx"/' < "${ROOTFS_DIR}/opt/openwebrx/config_webrx.py" > "${ROOTFS_DIR}/etc/openwebrx/config_webrx.py"
install -m 644 "${ROOTFS_DIR}/opt/openwebrx/bookmarks.json" "${ROOTFS_DIR}/etc/openwebrx/bookmarks.json"
install -m 644 "${ROOTFS_DIR}/opt/openwebrx/bands.json" "${ROOTFS_DIR}/etc/openwebrx/bands.json"

# remove config from checkout to avoid confusion
rm "${ROOTFS_DIR}/opt/openwebrx/config_webrx.py" "${ROOTFS_DIR}/opt/openwebrx/bookmarks.json" "${ROOTFS_DIR}/opt/openwebrx/bands.json"