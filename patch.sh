#!/bin/bash

cd "$(dirname "$0")"
source ./version

echo "==> getting sources"

if [ ! -d 'st' ] || [ ! -d 'st/.git' ]; then
  rm -rfv 'st'
  git clone git://git.suckless.org/st st
  cd 'st'
  git checkout $rev

else
  cd 'st'
  git reset --hard origin/master
  git checkout master
  git clean -xdf
  git pull
  git checkout $rev
fi

echo "==> applying unified patch file"

git am ../st-community-*-$rev.diff
