#!/bin/bash
set -e

if [ "$RUN_MIGRATIONS" = "true" ]; then
  echo "Running migrations..."
  bundle exec rails db:migrate
fi

exec "$@"