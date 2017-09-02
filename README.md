# 2017.04.04.progress.report
[progress report tomcat](http://enucatl-presentations.github.io/2017.04.04.progress.report)
1280x780 resolution

git hook to push the compiled version to gh-pages
-------------------------------------------------
```
ln -s ../../pre-push .git/hooks/pre-push 
```

git subtree remotes
-------------------
add
```
git remote add eth-reveal-theme git@github.com:enucatl-presentations/eth-reveal-theme.git
```

push
```
git subtree push --prefix=source/vendor/eth-reveal-theme eth-reveal-theme master
```

video on youtube (unlisted, in case it doesnt work from the slide: https://youtu.be/ZhTkCU1hT08)
