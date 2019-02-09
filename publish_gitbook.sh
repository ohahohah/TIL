git checkout gh-pages

# opt01. before push to remote 
git merge --squash master --no-edit 
git commit -m "squash and merge master"

# opt02. Publish remote repository contents 
#git pull origin gh-pages --rebase

gitbook install&&gitbook build

cp -R _book/* .
git clean -fx node_modules
git clean -fx _book

git add .
git commit -a -m "Update docs"
git push origin gh-pages

git checkout master
