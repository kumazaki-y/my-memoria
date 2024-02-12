#!/bin/bash
set -e

bundle exec rails db:migrate RAILS_ENV=development

exec "$@"