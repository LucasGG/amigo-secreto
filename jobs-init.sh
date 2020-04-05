#!/usr/bin/env sh
set -e

if [ -z "${RACK_ENV}" ]; then export RACK_ENV=development; fi

bin/sidekiq -q emails
