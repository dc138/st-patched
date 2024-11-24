#!/usr/bin/env bash

cd "$(dirname "$0")"
source ./version

echo "==> getting sources"

[ -e 'st' ] && rm -rfv 'st'

git clone $url 'st' && pushd 'st'
git checkout $rev

echo "==> applying patches"

for file in ../patches/*.diff; do
  if ! patch -p1 --no-backup-if-mismatch < $file; then
    echo "=> failed to apply patch $(basename $file), aborting..."
    exit

  else
    echo "=> correctly applied patch $(basename $file)"
  fi
done

popd
