#!/usr/bin/env bash
set -euxo pipefail

DEB=js8call_2.1.1_armhf.deb

pushd /tmp
wget http://files.js8call.com/2.1.1/js8call_2.1.1_armhf.deb
dpkg -i $DEB
rm $DEB
popd