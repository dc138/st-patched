#!/bin/bash

cd "$(dirname "$0")"

rev='9846a56'
date=$(date '+%Y%m%d')

if [ ! -d 'st' ] || [ ! -d 'st/.git' ]; then
  rm -rfv 'st'
  git clone git://git.suckless.org/st st
  cd 'st'
else
  cd 'st'
  git reset --hard origin/master
  git checkout master
  git clean -xdf
  git pull
  git checkout $rev
fi

for f in ../patches/*.diff; do
  patch -p1 --no-backup-if-mismatch < $f
done

git add .
git commit -m 'st-patched: apply patches'
git format-patch 'HEAD^' --stdout > "../st-patched-$date-$rev.diff"
