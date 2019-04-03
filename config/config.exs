use Mix.Config

config :paperwork_service_configs, Paperwork.Server,
    adapter: Plug.Cowboy,
    plug: Paperwork,
    scheme: :http,
    port: 8880

config :paperwork_service_configs,
    maru_servers: [Paperwork.Server]

config :logger,
    backends: [:console]
