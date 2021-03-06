defmodule Paperwork.Configs.Application do
    use Application

    def start(_type, _args) do
        case Code.ensure_loaded(ExSync) do
            {:module, ExSync = mod} ->
                mod.start()
            {:error, _} ->
                :ok
        end

        children = [
            Paperwork.Ex,
            Paperwork.Configs.Server,
            {Mongo, [name: :mongo, url: Confex.fetch_env!(:paperwork, :mongodb)[:url], pool: DBConnection.Poolboy]}
        ]

        opts = [strategy: :one_for_one, name: Paperwork.Configs.Supervisor]
        Supervisor.start_link(children, opts)
    end
end
