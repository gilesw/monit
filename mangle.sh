#!/usr/bin/env bash


wget -q https://mmonit.com/monit/  -O /tmp/monit.html
MONIT_VERSION=$(grep 'dist/binary' /tmp/monit.html | head -1 | perl -ne '/binary\/([\d|\.]*)\/monit/ && print $1')



MONIT_VERSION=${1:-$MONIT_VERSION}

echo $MONIT_VERSION

current_dir=`pwd`

cd $MONIT_VERSION
ln -s monit-${MONIT_VERSION}-linux-x64.tar.gz monit-${MONIT_VERSION}-linux-x86_64.tar.gz
ln -s monit-${MONIT_VERSION}-linux-arm64.tar.gz monit-${MONIT_VERSION}-linux-aarch64.tar.gz
