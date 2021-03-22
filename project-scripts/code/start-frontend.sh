#!/bin/sh
# Stop at first failing command.
set -e

function waitForPort {
  echo Waiting for $1 to open
  while ! nc -z localhost $1; do
    sleep 0.1
  done
}

cd ~/code/eikaiwa_content_frontend/

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
echo "Waiting for backend"
echo "================================================================================"
waitForPort 3001

echo
echo "Regenerating enums"
echo "================================================================================"
yarn run generate:enums

echo
echo "Starting server"
echo "================================================================================"
# Increase node memory limit to 4GB to reduce rate of crashes
export NODE_OPTIONS=--max-old-space-size=4096
yarn start $*
