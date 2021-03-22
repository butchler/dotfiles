#!/bin/sh
# Stop at first failing command.
set -e

echo "Resetting db/structure.sql"
echo "================================================================================"
# structure.sql will be updated after every migration, but intermediate versions do not need to be
# commited, so just reset any changes to it.
git checkout HEAD ./db/structure.sql

echo
echo "Reloading DB"
echo "================================================================================"
./tools/reload-db $*

echo
echo "Starting server"
echo "================================================================================"
bundle exec rails s -p 3001
