#!/usr/bin/env bash

wget -q https://mmonit.com/monit/  -O /tmp/monit.html
MONIT_VERSION=$(grep 'dist/binary' /tmp/monit.html | head -1 | perl -ne '/binary\/([\d|\.]*)\/monit/ && print $1')
current_dir=`pwd`
if [[ ! -d $MONIT_VERSION ]];then
  mkdir $MONIT_VERSION
  cd $MONIT_VERSION
  for bin in `grep 'dist/binary/' /tmp/monit.html | perl -ne '/(monit-.*)\" class/ && print "$1 "'`;do
    monit_url=https://mmonit.com/monit/dist/binary/$MONIT_VERSION/$bin
    echo $monit_url
    wget $monit_url
    sleep 5
  done
fi
cd $current_dir


