#!/usr/bin/env bash

cd "$(dirname "$0")"
source ./version

echo "==> getting sources"

[ -e 'st' ] && rm -rfv 'st'

git clone $url 'st' && pushd 'st' || exit
git checkout $rev || exit

echo "==> applying patches"

for file in ../patches/*.diff; do
  if ! patch -p1 --no-backup-if-mismatch < $file; then
    echo "=> failed to apply patch $(basename $file), aborting..."
    exit 1

  else
    echo "=> correctly applied patch $(basename $file)"
  fi
done

for file in ../files/*; do
    if cp $file . ; then
        echo "=> copied binary file $(basename $file)"
    fi
done

popd
