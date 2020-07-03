defmodule Pulsar.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    topologies = [
      gossip: [
        strategy: Cluster.Strategy.Gossip,
        config: [
          port: 45892,
          if_addr: "0.0.0.0",
          multicast_addr: "230.1.1.251",
          multicast_ttl: 1
        ]
      ]
    ]

    children = [
      {Highlander, Pulsar.Jobs.HelloWorld},
      {Cluster.Supervisor, [topologies, [name: Pulsar.ClusterSupervisor]]}
    ]

    Periodic.Logger.install(:hello_world)

    opts = [strategy: :one_for_one, name: Pulsar.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
