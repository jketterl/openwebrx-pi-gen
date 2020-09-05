#!/usr/bin/env bash
set -euo pipefail

pushd /tmp

wget https://downloads.sourceforge.net/project/drm/dream/2.1.1/dream-2.1.1-svn808.tar.gz
tar xvfz dream-2.1.1-svn808.tar.gz
pushd dream
patch -Np0 < ../dream.patch
qmake CONFIG+=console
make
make install
popd
rm -rf dream
rm dream-2.1.1-svn808.tar.gz

popd