FROM elixir:alpine

RUN apk add --update alpine-sdk postgresql-client inotify-tools nodejs npm gcc

RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix archive.install hex phx_new 1.4.16

WORKDIR /app
EXPOSE 4000
