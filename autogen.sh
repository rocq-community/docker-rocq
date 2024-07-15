#!/bin/sh
# Author: Erik Martin-Dorel, 2024
#
# NOTE: this script can be safely removed. It is only useful for the
# docker-keeper-template repository, to re-create a "fresh" subtree.
#
# For updating the docker-keeper subtree in your fork, rather use:
# git subtree pull --squash -P external/docker-keeper https://gitlab.com/erikmd/docker-keeper.git master

set -ex

base=53b199737e7c78a9fa0dbff8827fc7296a147723
merge=$(git rev-list "${base}..HEAD" -- external/docker-keeper/VERSION | head -n 1)
squash=$(git rev-parse --verify "${merge}^2")

git rm -r external/docker-keeper
git commit -m "fixup! ${squash}" -m "Remove external/docker-keeper"

echo >&2 'k: Please drop the (Squashed…content, fixup! Squashed…content) commits'
git rebase -i --autosquash "${base}"

git subtree add --squash -P external/docker-keeper https://gitlab.com/erikmd/docker-keeper.git master

echo >&2 'You can run:'
echo >&2 'git push --force-with-lease'
