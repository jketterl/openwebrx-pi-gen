#!/usr/bin/env bash
set -euxo pipefail

DEB=js8call_2.2.0_armhf.deb

pushd /tmp
wget http://files.js8call.com/2.2.0/${DEB}
dpkg -i $DEB
rm $DEB
popd