#!/usr/bin/env sh
set -e

[ -z "${RACK_ENV}" ] && export RACK_ENV=development

bin/sidekiq -q emails
