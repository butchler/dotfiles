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

cd ~/code/eikaiwa_content_frontend

if [ -z "$1" ]; then
  # Default to current branch
  BRANCH_NAME="$(git symbolic-ref --short HEAD)"
else
  BRANCH_NAME="$1"
fi

cd ~/code/eikaiwa_content_frontend/

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
echo "Cleaning files"
echo "================================================================================"
yarn build:clean

echo
echo "Regenerating configs"
echo "================================================================================"
yarn run generate:config

echo
echo "Regenerating enums"
echo "================================================================================"
yarn run generate:enums

echo
echo "Starting server"
echo "================================================================================"
# Increase node memory limit to 4GB to reduce rate of crashes
export NODE_OPTIONS=--max-old-space-size=4096
yarn start
