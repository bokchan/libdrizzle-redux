#!/bin/bash

set -e

## Get the parent of a PR

# `https://developer.github.com/v3/pulls/#list-commits-on-a-pull-request`

# example:

#    curl https://api.github.com/repos/sociomantic-tsunami/libdrizzle-redux/pulls/$TRAVIS_PULL_REQUEST/commits



# TRAVIS_PULL_REQUEST: The pull request number if the current job is a pull request, “false” if it’s not a pull request.
# TRAVIS_PULL_REQUEST_BRANCH: if the current job is a pull request, the name of the branch from which the PR originated. if the current job is a push build, this variable is empty ("").

#    jq '.[0].parents[0] | .sha' commits.json  | tr -d '"' | xargs git diff

#PR_PARENT_SHA=`curl https://api.github.com/repos/sociomantic-tsunami/libdrizzle-redux/pulls/$TRAVIS_PULL_REQUEST/commits | \
#jq '.[0].parents[0] | .sha' | tr -d '"'`

#echo "PR_PARENT_SHA $PR_PARENT_SHA"

echo "TRAVIS_PULL_REQUEST_SLUG: $TRAVIS_PULL_REQUEST_SLUG"
echo "TRAVIS_PULL_REQUEST_SHA: $TRAVIS_PULL_REQUEST_SHA"
echo "TRAVIS_PULL_REQUEST: $TRAVIS_PULL_REQUEST"
echo "TRAVIS_PULL_REQUEST_BRANCH: $TRAVIS_PULL_REQUEST_BRANCH"
