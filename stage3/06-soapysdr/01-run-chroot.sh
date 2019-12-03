#!/usr/bin/env bash
set -euxo pipefail

pushd /tmp
git clone https://github.com/pothosware/SoapySDR
pushd SoapySDR
mkdir build
pushd build
cmake ..
make
sudo make install
popd
popd
rm -rf SoapySDR
ldconfig

git clone https://github.com/pothosware/SoapySDRPlay.git
pushd SoapySDRPlay
mkdir build
pushd build
cmake ..
make
sudo make install
popd
popd
rm -rf SoapySDRPlay
ldconfig

git clone https://github.com/pothosware/SoapyAirspy.git
pushd SoapyAirspy
mkdir build
pushd build
cmake ..
make
sudo make install
popd
popd
rm -rf SoapyAirspy
ldconfig

git clone https://github.com/rxseger/rx_tools
pushd rx_tools
mkdir build
pushd build
cmake ..
make
sudo make install
popd
popd
rm -rf rx_tools

popd
