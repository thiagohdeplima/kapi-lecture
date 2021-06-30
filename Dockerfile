FROM elixir:1.12-alpine

ARG MIX_ENV=dev
ENV MIX_ENV=${MIX_ENV}

WORKDIR /srv/app

COPY . .

RUN mix local.hex --force
RUN mix local.rebar --force

RUN mix deps.get \
    && mix deps.compile \
    && mix compile
