defmodule Paperwork.Configs.MixProject do
    use Mix.Project

    def project do
        [
            app: :paperwork_service_configs,
            version: "0.1.0",
            elixir: "~> 1.8",
            start_permanent: Mix.env() == :prod,
            deps: deps()
        ]
    end

    def application do
        [
            extra_applications: [:confex, :logger],
            mod: {Paperwork.Application, []}
        ]
    end

    defp deps do
        [
            # {:paperwork, path: "../paperwork.ex"},
            {:paperwork, git: "https://github.com/paperwork/paperwork.ex.git"},
            {:confex, "~> 3.4"},
            {:maru, "~> 0.14.0-pre.1"},
            {:plug_cowboy, "~> 2.0"},
            {:jason, "~> 1.1"},
            {:corsica, "~> 1.1"},
            {:mongodb, "~> 0.4.7"},
            {:poolboy, "~> 1.5"},
            {:elixir_uuid, "~> 1.2"},
            {:distillery, "~> 2.0"},
            {:exsync, "~> 0.2", only: :dev}
        ]
    end
end
