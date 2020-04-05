#!/usr/bin/env sh
set -e

if [ -z "${RACK_ENV}" ]
then
  export RACK_ENV=development
fi

if [ -f tmp/pids/server.pid ]
then
  rm tmp/pids/server.pid
fi

bin/rails db:create
bin/rails db:migrate

bin/rails server puma --binding=0.0.0.0
