#!/usr/bin/env sh

# 发生错误时终止
set -e

if branch=$(git symbolic-ref --short -q HEAD)
then
    echo $branch
    cd examples
    npm install yarn
    yarn
    yarn build
    cd -
    git add -A
    git commit -m "auto push while running deploy.sh"
    git push
    git checkout master
    git merge $branch
    git push
    git push -f git@github.com:logic-flow/docs.logic-flow.cn.git master:gh-pages
else
    echo not on any branch
fi

# git add -A
# git commit -m "auto push while running deploy.sh"
# git push

# cd examples

# # 构建
# npm run build

# # 进入构建文件夹
# cd dist

# # 如果你要部署到自定义域名
# # echo 'www.example.com' > CNAME

# git checkout master
# git add -A
# git commit -m 'deploy'

# # 如果你要部署在 https://<USERNAME>.github.io

# # git push -f git@github.com:<USERNAME>/<USERNAME>.github.io.git master

# # 如果你要部署在 https://<USERNAME>.github.io/<REPO>
# # git push -f git@github.com:<USERNAME>/<REPO>.git main:gh-pages
# git push -f git@github.com:logic-flow/docs.logic-flow.cn.git master:gh-pages

# cd -
