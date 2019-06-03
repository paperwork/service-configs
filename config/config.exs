use Mix.Config

config :paperwork_service_configs, Paperwork.Configs.Server,
    adapter: Plug.Cowboy,
    plug: Paperwork.Configs,
    scheme: :http,
    ip: {0,0,0,0},
    port: {:system, :integer, "PORT", 8880}

config :paperwork_service_configs,
    maru_servers: [Paperwork.Configs.Server]

config :paperwork, :server,
    app: :paperwork_service_configs,
    cache_ttl_default: 86_400,
    cache_janitor_interval: 60

config :paperwork, :mongodb,
    url: {:system, :string, "MONGODB_URL", "mongodb://localhost:27017/configs"}

config :paperwork, :internal,
    cache_ttl: 60,
    configs:     {:system, :string, "INTERNAL_RESOURCE_CONFIGS",     "http://localhost:8880/internal/configs"},
    users:       {:system, :string, "INTERNAL_RESOURCE_USERS",       "http://localhost:8881/internal/users"},
    notes:       {:system, :string, "INTERNAL_RESOURCE_NOTES",       "http://localhost:8882/internal/notes"},
    attachments: {:system, :string, "INTERNAL_RESOURCE_ATTACHMENTS", "http://localhost:8883/internal/attachments"},
    journals:    {:system, :string, "INTERNAL_RESOURCE_JOURNALS",    "http://localhost:8884/internal/journals"}

config :logger,
    backends: [:console]
