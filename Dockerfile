FROM elixir:1.10 as elixir

RUN mix do local.hex --force, local.rebar --force

FROM elixir

WORKDIR /pulsar

COPY . .

RUN mix deps.get
RUN mix release pulsar

WORKDIR /pulsar/_build/dev/rel/pulsar/bin

CMD ["./pulsar", "start"]
