#!/bin/bash

TIMESTAMP=`date "+%Y-%m-%d %k:%M:%S %Z"`
NOW=`date "+%Y%m%d-%k%M%S"`
BRANCH=RepoABranch_$NOW
git fetch
git rebase origin/master
git checkout -b $BRANCH
./addTestFile.sh
printf "1. RepoA new commit at: $TIMESTAMP\n" >> Readme.md 
git add .
git commit -m "RepoA new commit at: $TIMESTAMP" 
git push origin $BRANCH
git checkout master
git fetch
git rebase origin/master
