#!/usr/bin/env sh
set -e

[ -z "${RACK_ENV}" ] && export RACK_ENV=development

[ -f tmp/pids/server.pid ] && rm tmp/pids/server.pid

bin/rails db:create
bin/rails db:migrate

bin/rails server puma --binding=0.0.0.0
