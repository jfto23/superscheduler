#!/usr/bin/env sh

set -e

sudo npm run build
sudo chmod a+rwx ~/Documents/superscheduler/dist/

cd dist

git init
git add -A
git commit -m 'deploy'

git push -f git@github.com:jfto23/superscheduler.git master:gh-pages

cd -
