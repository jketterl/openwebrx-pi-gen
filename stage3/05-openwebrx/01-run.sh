#!/usr/bin/env bash
install -m 644 files/openwebrx.service	"${ROOTFS_DIR}/etc/systemd/system/openwebrx.service"

on_chroot << EOF
systemctl enable openwebrx
EOF