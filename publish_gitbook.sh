git checkout gh-pages
git merge master
#git pull origin gh-pages --rebase

gitbook build

cp -R _book/* .
git clean -fx node_modules
git clean -fx _book

git add .
git commit -a -m "Update docs"
#git push origin gh-pages

#git checkout master
