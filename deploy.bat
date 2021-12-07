mkdocs build
git init
git add .
git commit -m "first commit"
git remote add origin https://github.com/dsinmsdj/iqscript-doc.git
git push -u origin master
mkdocs gh-deploy
