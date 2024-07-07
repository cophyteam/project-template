cd website
quarto render
cd ..
git add .
git commit -m "update project site"
git push
cd website
quarto publish gh-pages --no-render --np-prompt