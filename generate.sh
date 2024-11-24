#!/usr/bin/env bash

cd "$(dirname "$0")"
source ./version

./patch.sh

echo "==> generaing unified patch file"

rm -f st-community-*-*.diff
pushd 'st'
date=$(date '+%Y%m%d')

git add .
git commit -m 'st-community: apply patches'
git format-patch 'HEAD^' --stdout > "../st-community-$date-$rev.diff"

popd
