#!/bin/bash
# Stop at first failing command.
set -e

function wait-for-port {
  echo Waiting for $1 to open
  while ! nc -z localhost $1; do
    sleep 0.1
  done
}

echo "Waiting for backend"
echo "================================================================================"
wait-for-port 3001

cd ~/code/eikaiwa-realtime

if [ -z "$1" ]; then
  # Default to current branch
  BRANCH_NAME="$(git symbolic-ref --short HEAD)"
else
  BRANCH_NAME="$1"
fi

echo "Switching branches"
echo "================================================================================"
git checkout $BRANCH_NAME
if [ "$BRANCH_NAME" == "master" ]; then
  git pull
fi

echo
echo "Installing dependencies"
echo "================================================================================"
yarn install

echo
echo "Regenerating configs"
echo "================================================================================"
# Remove all exisiting config files so they are reset to the stubs.
rm -f ./config/*.yaml
yarn generate:config

#echo
#echo "Purging"
#echo "================================================================================"
#yarn purge

echo
echo "Resetting Redis"
echo "================================================================================"
redis-cli flushdb

echo
echo "Starting server"
echo "================================================================================"
yarn start:dev
