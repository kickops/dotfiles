#!/bin/bash
# Author: Kicky


print_exit ()
{
echo "Error: Not inside a git repository"
exit 1
}

configure_upstream() {
repo_url=`git remote -vv | grep origin | grep fetch | awk '{print $2}'`
upstream_url=`echo "${repo_url/<FORKED_REPO>/<UPSTREAM_REPO>}"`
git remote add upstream $upstream_url && echo "Added upstream repository."
}


## MAIN
git rev-parse --is-inside-work-tree > /dev/null 2>&1 || print_exit

echo "Step 1: Checking for local changes and staching it"
if [[ -z $(git status -s) ]]
then
  echo "Git branch is clean. Proceeding further.."
else
  echo "Git tree is dirty, Stashing the changes before sync.."
  git stash
  stashed="yes"
fi

echo "Step 2: Configuring the upstream repo if not configured already"
git remote -v | grep upstream || configure_upstream

echo "Step 3: Fetch from upstream repository"
git fetch upstream

echo "Step 4: Rebasing the branch"
branch=$(git branch | grep \* | cut -d ' ' -f2)
git rebase upstream/$branch

echo "Step 5: Pushing the changes to the local branch"
git push origin $branch

if [[ $stashed == "yes" ]]; then
echo "Step 6: Popping up the stashed changes for you .."
git stash apply stash@{0}
fi
