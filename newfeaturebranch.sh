!/bin/bash
git checkout $current-release-branch
git pull
git checkout -b features/$ticket_number-$feature