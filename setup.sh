#!/bin/bash

## Setup your MEAN.JS project
# http://blog.powma.com/git-you-some-mean-js-setup-advanced-git/

# Config for your project:
GITHUB=GITHUB_ACCOUNT
BITBUCKET=BITBUCKET_ACCOUNT
PROJECT=BITBUCKET_PROJECT

# Fork project on GitHub

#  Clone it
git clone git@github.com:$GITHUB/mean.git $PROJECT
cd $PROJECT

#  Make your dev branch
git checkout -b dev

#  Make a remote called upstream to the Official repo
git remote add upstream https://github.com/meanjs/mean.git

# fetch upstream repo data.
git fetch upstream

#  Branch for MEAN.JS code - track upstream master for changes
git checkout -b meanjs --track upstream/master

#  Configure remote for pull requests
git remote rename origin fork

#  Setup a private repo.  Don't forget your ssh key

#  Configure new origin to private repo
git remote add origin git@bitbucket.org:$BITBUCKET/$PROJECT.git

# Push local branches to origin.  Set upstream so they push/pull to origin automatically
git push --set-upstream origin master
git push --set-upstream origin dev
# leave meanjs upstream as remote upstream
git push origin meanjs

# Ok, end of configuration
exit 0


## Task: Update project from Official MEAN.JS

git pull upstream master
# Or because we used --track to configure branch
git checkout meanjs
git pull
# Switch to our dev branch and merge changes
git checkout dev
git merge meanjs


## TASK: Contribute code back to MEAN.JS

# Syntax: [remote] [branch]
git push fork meanjs
# Goto GitHub.com and make your pull request
