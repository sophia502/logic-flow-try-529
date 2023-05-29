#!/bin/bash

# 加载 nvm
. ~/.nvm/nvm.sh

# 使用 Node.js 16
nvm use 16
echo "nvm changed 16"
npm install yarn
echo "yarn install"
yarn
echo "run yarn"
yarn build
echo "build yarn"

rm -rf ./deploy
mkdir -p deploy/examples
mkdir -p deploy/docs
mkdir -p deploy/demo
cp -rf index.html ./deploy
cp -rf ./docs/* ./deploy/docs
cp -rf ./examples/dist/* ./deploy/examples
cd ./demo
for file in ./*
do
if [ -d $file/dist ];then
    echo $file/dist
    mkdir -p ./dist/$file
    cp -rf $file/dist/* dist/$file/
fi
done
cd -
cp -rf ./demo/dist ./deploy/demo