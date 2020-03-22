#!/bin/sh
# Adapted from Alex Kleissner's post, Running a Phoenix 1.3 project with docker-compose
# https://medium.com/@hex337/running-a-phoenix-1-3-project-with-docker-compose-d82ab55e43cf
set -e
# shellcheck disable=SC2039
source ./.env

# Ensure the app's dependencies are installed
mix deps.get

# Wait for Postgres to become available.
until psql "postgresql://$POSTGRES_USER:$POSTGRES_PASSWORD@database/$POSTGRES_DATABASE" '\q' 2>/dev/null; do
  >&2 echo "Postgres is unavailable - retrying in 1 second"
  sleep 1
done

# Potentially Set up the database
mix ecto.create
mix ecto.migrate

echo "Launching Phoenix web server..."
# Start the phoenix web server
mix phx.server
