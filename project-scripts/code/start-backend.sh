#!/bin/bash
# Stop at first failing command.
set -ex

cd ~/code/eikaiwa_content

# Specify --reset as first argument to drop database and load latest dump.
reset_db='false'
switch_db='true'
if [ "$1" == "--reset" ]; then
  switch_db='true'
  reset_db='true'
  shift
elif [ "$1" == "--no-switch" ]; then
  switch_db='false'
  shift
fi

if [ -z "$1" ]; then
  # Default to current branch
  BRANCH_NAME="$(git symbolic-ref --short HEAD)"
else
  BRANCH_NAME="$1"
fi

DB_NAME="eikaiwa_development_$BRANCH_NAME"
TEST_DB_NAME="eikaiwa_test_$BRANCH_NAME"

cd ~/code/eikaiwa_content/

echo "Switching branches"
echo "================================================================================"
# structure.sql will be updated after every migration, but intermediate versions do not need to be
# commited, so just reset any changes to it.
git checkout HEAD ./db/structure.sql
git checkout $BRANCH_NAME
if [ "$BRANCH_NAME" == "master" ]; then
  git pull
fi

# Disabling this for now because it's slow and causes Redis to restart, which
# messes up the realtime server.
#echo
#echo "Installing homebrew dependencies"
#echo "================================================================================"
#brew bundle

#echo
#echo "Installing ruby dependencies"
#echo "================================================================================"
#bundle install

echo
echo "Regenerating configs"
echo "================================================================================"
bundle exec ruby tools/app_config.rb generate all -o

# Switch to branch-specific DB
if [ "$switch_db" == "true" ]; then
  echo
  echo "Updating database.yml"
  echo "================================================================================"
  unlink ./config/database.yml
  sed -e "s/eikaiwa_development/$DB_NAME/g" -e "s/eikaiwa_test/$TEST_DB_NAME/g" ./config/database.yml.stub > ./config/database.yml
fi

args='-s config'

# Don't initialize DB if already exists.
if [ "$reset_db" != 'true' ] && [ "$(psql -U postgres postgres -tAc "SELECT 1 FROM pg_database WHERE datname='$DB_NAME'")" == '1' ]; then
  echo "DB $DB_NAME already exists"
  args="$args -s fetch -s db"
fi

echo
echo "Loading DB"
echo "================================================================================"
./tools/reload-db $args

#echo
#echo "Clearing cache"
#echo "================================================================================"
#bundle exec rails r "Rails.cache.clear"

echo
echo "Starting server"
echo "================================================================================"
bundle exec rails s -p 3001
