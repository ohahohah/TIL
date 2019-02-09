gitbook install && gitbook build

git checkout gh-pages
git pull origin gh-pages --rebase

# gitbook build로 생긴 _book폴더 아래 모든 정보를 현재 위치로 가져온다.
cp -R _book/* .

# node_modules폴더와 _book폴더를 지워준다.
git clean -fx node_modules
git clean -fx _book

git add .

git commit -a -m "Update docs"

git push origin gh-pages

git checkout master
