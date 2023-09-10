#!/bin/bash
# (cc) 2016 diamond-patterns

LOGIN=covid-web
HOSTNAME=somewhere.pool.example.com

echo "This script will set up a remote host as a git repository."

git remote -v

ssh ${LOGIN}@${HOSTNAME} "git init --bare ~/site.git"
git remote add origin ${LOGIN}@${HOSTNAME}:site.git
git push --set-upstream origin master

ssh ${LOGIN}@${HOSTNAME} "git clone ~/site.git ~/site"
ssh ${LOGIN}@${HOSTNAME} "cd ~/site && make depends"

echo "NB: Now run the following:"
echo "git remote set-url origin --push --add LOGIN@ORIGINAL-REPO.git"
echo "git push"
