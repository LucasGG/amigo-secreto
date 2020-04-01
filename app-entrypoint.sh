#!/usr/bin/env sh
set -e

bundle check || bundle install -j4 --retry 3

$@
