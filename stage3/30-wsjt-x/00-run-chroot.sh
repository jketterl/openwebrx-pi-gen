#!/usr/bin/env bash
set -euxo pipefail

DEB=wsjtx_2.1.2_armhf.deb

apt-get purge --autoremove wsjtx wsjtx-data

pushd /tmp
wget http://physics.princeton.edu/pulsar/k1jt/$DEB
dpkg -i $DEB
rm $DEB
popd