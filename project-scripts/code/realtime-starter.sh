#!/bin/sh
# Stop at first failing command.
set -e

function waitForPort {
  echo Waiting for $1 to open
  while ! nc -z localhost $1; do
    sleep 0.1
  done
}

cd ~/code/eikaiwa-realtime

echo "Installing dependencies"
echo "================================================================================"
yarn install

echo
echo "Regenerating configs"
echo "================================================================================"
yarn generate:config -o

echo
echo "Waiting for backend"
echo "================================================================================"
waitForPort 3001

echo
echo "Creating DB and running migrations"
echo "================================================================================"
yarn db:init

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
