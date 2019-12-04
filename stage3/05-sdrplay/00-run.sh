#!/usr/bin/env bash
cp files/install-lib.armv7l.patch	"${ROOTFS_DIR}/tmp"

echo "blacklist sdr_msi3101
blacklist msi001
blacklist msi2500" > "${ROOTFS_DIR}/etc/modprobe.d/sdrplay_blacklist.conf"
