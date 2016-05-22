#!/bin/bash
# usage: bin/deploy

#---------------------------
# Program variables
#---------------------------
current_branch=`git rev-parse --abbrev-ref HEAD`
white=$(tput setaf 7)
red=$(tput setaf 1)
reset=$(tput sgr0)

#---------------------------
# Helper Methods
#---------------------------

ensure_success()
{
  if [ $? -ne 0 ]; then
    exit 1
  fi
}

#---------------------------
# Program Logic
#---------------------------

echo "$red Checking out to gh-pages branch:$reset"
git checkout gh-pages
ensure_success

echo "$red Merging ${current_branch} into gh-pages:$reset"
git merge $current_branch
ensure_success

echo "$red Rebuilding node_modules folder:$reset"
npm install
ensure_success

echo "$red Pushing your changes to the gh-pages branch:$reset"
git push origin gh-pages
ensure_success

echo "$white Returning you to your branch:$reset"
git checkout $current_branch
ensure_success